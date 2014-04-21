require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "name must be present" do
    user = User.new
    assert_not user.save, "the name of the user must be present"
  end

  test "User has many leader Groups" do
    user = User.create name: "Ricardo"
    group = Group.create name: "test", leader_id: user.id
    assert_equal user.leader_groups.first.name, group.name, "leader_groups from users doesnt work" 
  end

  test "User has many companion_one Groups" do
    user = User.create name: "Ricardo"
    group = Group.create name: "test", companion_one_id: user.id
    assert_equal user.companion_one_groups.first.name, group.name, "companion_one_groups from users doesnt work" 
  end

  test "User has many companion_two Groups" do
    user = User.create name: "Ricardo"
    group = Group.create name: "test", companion_two_id: user.id
    assert_equal user.companion_two_groups.first.name, group.name, "companion_two_groups from users doesnt work" 
  end
end
