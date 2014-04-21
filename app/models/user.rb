class User < ActiveRecord::Base
  validates :name, presence: true

  has_one :group
end
