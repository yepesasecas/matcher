class UserGroup < ActiveRecord::Base
  OWNER = :owner
  
  belongs_to :user
  belongs_to :group

  scope :owner, ->{where(role: UserGroup::OWNER)}

  def set_as_owner
    self.update(role: UserGroup::OWNER)
  end
end
