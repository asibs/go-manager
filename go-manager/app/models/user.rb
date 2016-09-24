class User < ApplicationRecord

  # Relationships
  has_many :monster

  # Validation
  validates_format_of :display_name, with: /\A[A-Za-z0-9]+\z/,
    message: "must contain only alphanumeric characters"


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def logout
    # Clear any OAuth tokens we have stored in the DB
    self.oauth_token = nil
    self.oauth_expires_at = nil
    self.save!
  end

end
