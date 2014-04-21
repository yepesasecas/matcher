class Group < ActiveRecord::Base
  before_save :unique_members?

  belongs_to :leader, class_name: "User", foreign_key: "leader_id"
  belongs_to :companion_one, class_name: "User", foreign_key: "companion_one_id"
  belongs_to :companion_two, class_name: "User", foreign_key: "companion_two_id"
  validates :name, presence: true

  private
    def unique_members?
      ids =  []
      ids << leader_id        if leader_id
      ids << companion_one_id if companion_one_id
      ids << companion_two_id if companion_two_id
      if ids.uniq!
        false
      else
        true
      end
    end
end
