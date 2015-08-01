# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  username   :string           not null
#  location   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  fname      :string
#  lname      :string
#

class User < ActiveRecord::Base
  has_many :authorizations
  has_many :feels
  validates :username, :email, presence: true, uniqueness: true

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

end
