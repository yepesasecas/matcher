require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  should have_many :user_groups
  should have_many :users

  should validate_numericality_of(:weekend_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:talk_about_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:meet_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)
  should validate_numericality_of(:social_status_value).is_less_than_or_equal_to(10).is_greater_than_or_equal_to(0)

  should validate_presence_of :weekend_value
  should validate_presence_of :talk_about_value
  should validate_presence_of :meet_value
  should validate_presence_of :social_status_value

  #should validate_uniqueness_of :invitation_token

  def setup
    @user  = User.first
    @group = @user.groups.create(weekend_value: 1, talk_about_value: 1, meet_value: 1, social_status_value: 1)

    @group.owner = @user
  end

  test "group owner" do
    assert_equal @user, @group.owner, "group owner is not returning the user"
  end

  test "group should have a invitation_token" do
    assert_not_nil @group.invitation_token, "group is not generating its invitation token"
  end

  test "group should have unique members" do
    @group.add_user @user
    assert_equal 1, @group.users.count, "groups should not allow same member to be included"
  end

  test "group add_member should return false if member already added." do
    assert_equal false, @group.add_user(@user), "add_user should return false if user is already in group"
  end

  test "group should only have 3 users" do
    @group.add_user User.create
    @group.add_user User.create
    @group.add_user User.create

    assert_equal 3, @group.users.count, "groups should not have more than 3 users"
  end

  test "group ready? should return true if all members are included" do
    @group.add_user User.create
    @group.add_user User.create

    assert @group.ready?, "ready? should return true, because members are included"
  end
  test "group ready? should return fasle if a member is missing" do
    @group.add_user User.create

    assert !@group.ready?, "ready? should return false, because group needs more members"
  end
end
