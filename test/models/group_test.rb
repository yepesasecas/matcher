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

  test "group owner" do
    user  = User.first
    group = user.groups.create(weekend_value: 1, talk_about_value: 1, meet_value: 1, social_status_value: 1)

    group.user_groups.where(group: group).first.update(role: UserGroup::OWNER)

    assert_equal user, group.owner, "group owner is not returning the user"
  end
end
