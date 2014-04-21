class Group < ActiveRecord::Base

  validates :name, presence: true
  belongs_to :leader, class_name: "User", foreign_key: "leader_id"
  belongs_to :companion_one, class_name: "User", foreign_key: "companion_one_id"
  belongs_to :companion_two, class_name: "User", foreign_key: "companion_two_id"
end
