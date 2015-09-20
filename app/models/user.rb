# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  location               :string           not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  fname                  :string
#  lname                  :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  confirmation_token     :string
#  confirmed_at           :datetime
#  confirmation_sent_at   :datetime
#  unconfirmed_email      :string
#  name                   :string
#

class User < ActiveRecord::Base
  TEMP_EMAIL_PREFIX = 'change@me'
  TEMP_EMAIL_REGEX = /\Achange@me/


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :authorizations
  has_many :feels, dependent: :destroy
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update
  has_many :accepted_friendships, -> { where "status = 'accepted'" },
           class_name: "Friendship"

  has_many :friends,
           through: :accepted_friendships

  has_many :requested_friends, -> { where status: 'requested' },
           through: :friendships

  has_many :pending_friends, -> { where status: 'requested' },
           through: :friendships

  has_many :inverse_friendships, class_name: :Friendship, foreign_key: :friend_id

  has_many :inverse_friends, through: :inverse_friendships, source: :user



  def add_provider(auth_hash)
    # Check if the provider already exists, so we don't add it twice
    unless authorizations.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      Authorization.create :user => self, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
  end

  def self.find_or_create(auth_hash)
    unless auth = find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"])
      user = User.create :name => auth_hash["user_info"]["name"], :email => auth_hash["user_info"]["email"]
      auth = create :user => user, :provider => auth_hash["provider"], :uid => auth_hash["uid"]
    end
    auth
  end

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      # Get the existing user by email if the provider gives us a verified email.
      # If no verified email was provided we assign a temporary email and ask the
      # user to verify it on the next step via UsersController.finish_signup
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      user = User.where(:email => email).first if email

      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          name: auth.extra.raw_info.name,
          #username: auth.info.nickname || auth.uid,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.skip_confirmation!
        user.save!
      end
    end

    # Associate the identity with the user if needed
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def self.find_by_username_or_email(query)
    User.find_by_name(query) || User.find_by_email(query)
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

end
