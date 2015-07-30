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

class Forecast < ActiveRecord::Base




end
