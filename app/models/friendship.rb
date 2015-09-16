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



end
