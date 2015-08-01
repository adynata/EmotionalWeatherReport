# == Schema Information
#
# Table name: feels
#
#  id         :integer          not null, primary key
#  feel       :string           not null
#  user_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feel < ActiveRecord::Base
  validates :user, :feel, presence: true
  belongs_to :user
  has_many :connections
  has_many(
    :friends,
    through: :connections,
    source: :users
    )


  def self.feels_tree
    feelers = File.readlines("#{Rails.root.to_s}/lib/assets/inventory.txt").map(&:chomp)
    feels_tree = Hash.new { |h, k| h[k] = [] }
    current_feel_category = nil

    feelers.each do |feel|
      if !feel.match(/\p{Lower}/)
        current_feel_category = feel
        feels_tree[current_feel_category] = []
      else feel.match(/\p{Lower}/)
        feels_tree[current_feel_category] << feel
      end
    end
    feels_tree
  end

  def self.all_feels
    feels_tree.flatten(2).map(&:downcase)
  end

end
