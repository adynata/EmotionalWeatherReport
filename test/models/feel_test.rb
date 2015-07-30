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

require 'test_helper'

class FeelTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
