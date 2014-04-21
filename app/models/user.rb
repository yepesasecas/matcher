class User < ActiveRecord::Base
  
  has_many :leader_groups, class_name: "Group", foreign_key: "leader_id"
  has_many :companion_one_groups, class_name: "Group", foreign_key: "companion_one_id"
  has_many :companion_two_groups, class_name: "Group", foreign_key: "companion_two_id"
  validates :name, presence: true
end
