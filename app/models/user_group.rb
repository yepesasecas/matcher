class UserGroup < ActiveRecord::Base
  OWNER = :owner
  
  belongs_to :user
  belongs_to :group
end
