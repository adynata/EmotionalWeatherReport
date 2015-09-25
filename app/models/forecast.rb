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
#does this change anything
require 'open_weather'
require 'date'

class Forecast < ActiveRecord::Base
  validates :zipcode, :sunrise, :sunset, :conditions, :location, :date, presence: true
  attr_accessor :zipcode
  after_initialize :get_forecast
  CONDITIONS = [:sunny, :cloudy, ]
  #get full complement of possible weather descriptions from open weather

  def get_forecast
    if(!@zipcode)
      @zipcode = 94612;
    end
    forecast = OpenWeather::Current.city(@zipcode)
    self.conditions = forecast["weather"].first["main"]
    self.conditions_desc = forecast["weather"].first["description"]
    # object lookup for cond with underscores
    self.sunset = DateTime.strptime(forecast["sys"]["sunset"].to_s,'%s')
    self.sunrise = DateTime.strptime(forecast["sys"]["sunrise"].to_s,'%s')
    self.date = Date.today
    self.location = forecast["name"]
    self.current_temp = forecast["main"]["temp"]
    self.low_temp = forecast["main"]["temp_max"]
    self.high_temp = forecast["main"]["temp_min"]
    self.humidity = forecast["main"]["humidity"]
  end

  def condition

  end



end
