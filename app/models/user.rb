class User < ApplicationRecord
  before_save :generate_slug
  validates :uid,          presence: true, uniqueness: true
  validates :username,     presence: true
  validates :avatar_url,   presence: true
  validates :oauth_token,  presence: true
  validates :oauth_secret, presence: true

  def self.from_omniauth(auth_info)
    find_or_create_by(uid: auth_info[:uid]) do | new_user |
      new_user.uid          = auth_info.uid
      new_user.username     = auth_info.info.nickname
      new_user.name         = auth_info.info.name
      new_user.oauth_token  = auth_info.credentials.token
      new_user.oauth_secret = auth_info.credentials.secret
      new_user.avatar_url   = auth_info.info.image
    end
  end

  private
    def generate_slug
      self.slug = username.parameterize
    end
end
