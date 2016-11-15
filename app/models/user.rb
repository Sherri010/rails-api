class User < ApplicationRecord
  has_secure_password
  # validates :first_name, presence: true
  # validates :last_name, presence:true
  # validates :username, presence:true
  # validates :email,presence:true, uniqueness: true


  before_create :set_auth_token

private

def set_auth_token
    if auth_token.present?
        return
    else
        self.auth_token = generate_auth_token
    end
end

def generate_auth_token
    return SecureRandom.uuid.gsub(/\-/, '')
end
end
