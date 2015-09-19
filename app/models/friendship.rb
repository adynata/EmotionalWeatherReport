# == Schema Information
#
# Table name: friendships
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Friendship < ActiveRecord::Base
  validates_presence_of :user_id, :friend_id
  validates_inclusion_of :status, :in => %w( accepted pending requested )
  belongs_to :user
  belongs_to :friend, class_name: :User, foreign_key: :friend_id

  #returns true if users are friends or pending friends
  def self.exists?(user, friend)
    not find_by_user_id_and_friend_id(user, friend).nil?
  end

  def self.request(user, friend)
    unless user == friend or Friendship.exists?(user,friend)
      transaction do
        create(user: user, friend: friend, status: 'pending')
        create(user: friend, friend: user, status: 'requested')
      end
    end
  end

  def self.accept(user, friend)
    transaction do
      accepted_at = Time.now
      accept_one_side(user, friend, accepted_at)
      accept_one_side(friend, user, accepted_at)
    end
  end

  def self.breakup(user, friend)
    transaction do
      destroy(find_by_user_id_and_friend_id(user, friend))
      destroy(find_by_user_id_and_friend_id(friend, user))
    end
  end


  private

  def self.accept_one_side(user, friend, accepted_at)
    request = find_by_user_id_and_friend_id(user, friend)
    request.status = 'accepted'
    request.accepted_at = accepted_at
    request.save!
  end


end
