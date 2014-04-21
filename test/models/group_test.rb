require 'test_helper'

class GroupTest < ActiveSupport::TestCase
  
  test "name must be present" do
    group = Group.new 
    assert_not group.save, "Group should validate presence of :name"
  end

  test "Group leader" do
    user  = User.create name: "Ricardo"
    group = Group.create name: "prueba", leader_id: user.id
    assert_equal user.name, group.leader.name, "The leader of the group is wrong"
  end

  test "Group companion_one" do
    user  = User.create name: "Ricardo"
    group = Group.create name: "prueba", companion_one_id: user.id
    assert_equal user.name, group.companion_one.name, "The companion_one of the group is wrong"
  end

  test "Group companion_two" do
    user  = User.create name: "Ricardo"
    group = Group.create name: "prueba", companion_two_id: user.id
    assert_equal user.name, group.companion_two.name, "The companion_two of the group is wrong"
  end

  test "prueba" do 
    assert true
  end
end
