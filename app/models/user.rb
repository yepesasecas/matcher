class User < ActiveRecord::Base
  
  has_many :leader_groups, class_name: "Group", foreign_key: "leader_id"
  has_many :companion_one_groups, class_name: "Group", foreign_key: "companion_one_id"
  has_many :companion_two_groups, class_name: "Group", foreign_key: "companion_two_id"
  validates :name, presence: true

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
