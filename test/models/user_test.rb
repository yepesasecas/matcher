require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should have_many :user_groups
  should have_many :groups
end
