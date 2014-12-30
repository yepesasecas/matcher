require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should have_many :user_groups
  should have_many :users

  should validate_presence_of :weekend_value
  should validate_presence_of :talk_about_value
  should validate_presence_of :meet_value
  should validate_presence_of :social_status_value

  should validate_numericality_of(:weekend_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:talk_about_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:meet_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:social_status_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
end
