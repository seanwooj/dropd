# == Schema Information
#
# Table name: status_transitions
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  transitionable_id   :integer
#  transitionable_type :string
#  event               :string
#  from_state          :string
#  to_state            :string
#  notes               :string
#  created_at          :datetime
#  updated_at          :datetime
#

require 'test_helper'

class StatusTransitionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
