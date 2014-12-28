require 'test_helper'

class NearestNodesTest < ActiveSupport::TestCase
  def setup
    @group_a = groups :one
    @group_b = groups :two

    10.times do
      Group.create(weekend_value: (0..10).to_a.sample,
                   talk_about_value: (0..10).to_a.sample,
                   meet_value: (0..10).to_a.sample,
                   social_status_value: (0..10).to_a.sample)
    end
  end

  test "nearest node to group_a" do
    assert_not_nil @group_a.nearest
  end
end