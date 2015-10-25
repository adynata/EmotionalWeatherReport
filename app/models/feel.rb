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
  attr_accessor :raw_feelers, :color, :mapped_colors
  validates :user, :feel, presence: true
  before_save :mapped_colors, :color
  belongs_to :user
  has_many :connections
  has_many(
    :friends,
    through: :connections,
    source: :users
    )


  # there are 15 categories of feelings!

  FEELS_CAT_HUES = {
    "AFRAID"=> "ffcb00", "ANNOYED"=> "ff9966", "ANGRY"=> "ff4c00", "AVERSION"=> "a9ff25", "CONFUSED"=> "cc00ff", "DISCONNECTED"=> "bbdd55", "DISQUIET"=> "3200ff", "EMBARRASSED"=> "ff4433", "FATIGUE"=> "ffcb99", "PAIN"=> "ff0011", "SAD"=> "66ddff", "TENSE"=> "feff99", "VULNERABLE"=> "99ffcc", "YEARNING"=> "7c26ff", "AFFECTIONATE"=> "9865ff", "ENGAGED"=> "df6628", "HOPEFUL"=> "00ffcb", "CONFIDENT"=> "3366ff", "EXCITED"=> "00ffb2", "GRATEFUL"=> "e565ff", "INSPIRED"=> "65cbff", "JOYFUL"=> "65ff98", "EXHILARATED"=> "ff3fff", "PEACEFUL"=> "7fff65", "REFRESHED"=>"9999ff"
  }

  def color
    @color = Feel.mapped_colors[self.feel]
  end

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

  def self.mapped_colors
    colors = feels_tree
    @mapped_colors = {}
    FEELS_CAT_HUES.each do |k,v|
      if colors["POSITIVE"][k]
        idx = colors["POSITIVE"][k].count
        feelers = colors["POSITIVE"][k]
        color = Paleta::Color.new(:hex, v )
        palette = Paleta::Palette.generate(:type => :analogous, :from => :color, :size => idx, :color => color)
        (0...idx).each do |i|
          @mapped_colors[feelers[i]] = palette[i].hex
        end
      else
        idx = colors["NEGATIVE"][k].count
        feelers = colors["NEGATIVE"][k]
        color = Paleta::Color.new(:hex, v)
        palette = Paleta::Palette.generate(:type => :analogous, :from => :color, :size => idx, :color => color)
        (0...idx).each do |i|
          @mapped_colors[feelers[i]] = palette[i].hex
        end
      end
    end
    @mapped_colors
  end

end
