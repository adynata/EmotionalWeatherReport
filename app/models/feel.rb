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
  attr_accessor :raw_feelers
  validates :user, :feel, presence: true
  belongs_to :user
  has_many :connections
  has_many(
    :friends,
    through: :connections,
    source: :users
    )

  def self.raw_feelers
    File.readlines("#{Rails.root.to_s}/lib/assets/inventory.txt").map(&:chomp)
  end

  def self.feels_tree
    feels_tree = Hash.new { |h, k| h[k] = {} }
    feel_class = nil
    current_feel_category = nil

    raw_feelers.each do |feel|
      if feel[0] == "_"
        feel_class = feel[1..-1]
        feels_tree[feel_class] = {}
      elsif !feel.match(/\p{Lower}/)
        current_feel_category = feel
        feels_tree[feel_class][current_feel_category] = []
      else feel.match(/\p{Lower}/)
        feels_tree[feel_class][current_feel_category] << feel
      end
    end
    feels_tree
  end


  def self.feels_tree_neg
    self.feels_tree["NEGATIVE"]
  end

  def self.feels_tree_pos
    self.feels_tree["POSITIVE"]
  end

  def self.all_feels
    feels_only = []
    raw_feelers.each do |feel|
      feels_only << feel if feel.match(/\p{Lower}/)
    end
    feels_only
  end

end
