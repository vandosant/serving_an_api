class User < ActiveRecord::Base

  before_create :create_api_token

  private

  def create_api_token
    self.api_authentication_token = SecureRandom.urlsafe_base64
  end
end
