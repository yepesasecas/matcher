require 'test_helper'

class NodeDistanceTest < ActiveSupport::TestCase
  
  def setup
    @group_a = groups :one
    @group_b = groups :two
  end

  test "Group should have a coordinates array" do
    assert_equal [1, 1, 1, 1], @group_a.coordinates, "group.coordinates doesnt match the array"
  end

  test "Group should know the distance to another Group" do
    assert_equal 0, @group_a.distance_to(@group_a), "group doesnt match distance to same group"
  end

  test "distance from fixture_one to fixture_to" do
    assert_equal 18, @group_a.distance_to(@group_b), "distance from a to b, doesnt match"
  end
end
