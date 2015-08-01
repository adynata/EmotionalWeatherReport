# == Schema Information
#
# Table name: forecasts
#
#  id         :integer          not null, primary key
#  location   :string           not null
#  date       :date             not null
#  sunrise    :time             not null
#  sunset     :time             not null
#  conditions :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# require 'open-weather'

class Forecast < ActiveRecord::Base
  validates :zipcode, :sunrise, :sunset, :conditions, :location, :date, presence: true
  attr_reader

  def initialize
    forecast = OpenWeather::Current.city(@zipcode)
    @sunrise = forecast["sys"]["sunrise"]
    @conditions = {}
    @location = forecast["name"]
    @sunset = forecast["sys"]["sunset"]
    @date = Date.today
    @temperatures = forecast["main"]
    @feels_like = forecast["weather"]
    make_conditions
  end


  def make_conditions
    @conditions[:temps] = @temperatures
    @conditions[:feels_like] = @feels_like
  end




end
