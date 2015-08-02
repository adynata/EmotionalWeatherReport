# == Schema Information
#
# Table name: forecasts
#
#  id              :integer          not null, primary key
#  location        :string           not null
#  date            :date             not null
#  sunrise         :time             not null
#  sunset          :time             not null
#  conditions      :string           not null
#  conditions_desc :string           not null
#  current_temp    :string           not null
#  low_temp        :string           not null
#  high_temp       :string           not null
#  humidity        :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'open_weather'

class Forecast < ActiveRecord::Base
  validates :zipcode, :sunrise, :sunset, :conditions, :location, :date, presence: true
  attr_accessor :zipcode
  after_initialize :get_forecast


  def get_forecast
    forecast = OpenWeather::Current.city("94608")
    self.conditions = forecast["weather"].first["main"]
    self.conditions_desc = forecast["weather"].first["description"]
    self.sunset = forecast["sys"]["sunset"]
    self.sunrise = forecast["sys"]["sunrise"]
    self.date = Date.today
    self.location = forecast["name"]
    self.current_temp = forecast["main"]["temp"]
    self.low_temp = forecast["main"]["temp_max"]
    self.high_temp = forecast["main"]["temp_min"]
    self.humidity = forecast["main"]["humidity"]
  end


end
