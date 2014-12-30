class User < ActiveRecord::Base
  has_many :user_groups
  has_many :groups, through: :user_groups

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.name             = auth.info.name
      user.email            = auth.info.email
      user.image            = auth.info.image
      user.provider         = auth.provider
      user.uid              = auth.uid
      user.oauth_token      = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end
