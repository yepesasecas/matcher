class Group < ActiveRecord::Base
  include Nodeable

  before_create :generate_invitation_token

  has_many :user_groups
  has_many :users, through: :user_groups

  validates :weekend_value, presence: true
  validates :talk_about_value, presence: true
  validates :meet_value, presence: true
  validates :social_status_value, presence: true

  validates :weekend_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :talk_about_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :meet_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}
  validates :social_status_value, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10}

  def add_user(user)
    return false if users.ids.include?(user.id)
    return false if users.count >= 3

    self.users << user
  end

  def coordinates
    [weekend_value, talk_about_value, meet_value, social_status_value]
  end

  def ready? 
    users.count == 3
  end

  def owner
    user_groups.where(role: UserGroup::OWNER).first.user
  end

  private
    def generate_invitation_token
      self.invitation_token = UUID.new.generate
    end
end
