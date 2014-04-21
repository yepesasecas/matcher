require 'test_helper'

class UserTest < ActiveSupport::TestCase
  
  test "name must be present" do
    user = User.new
    assert_not user.save, "the name of the user must be present"
  end
end
