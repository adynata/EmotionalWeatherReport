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

require 'test_helper'

class ForecastTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
