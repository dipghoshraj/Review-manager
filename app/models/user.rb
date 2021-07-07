class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  
  def create_session
    session_token = SecureRandom.urlsafe_base64(128, false)
    # chat_token = SecureRandom.urlsafe_base64(64, false)
    # notification_channel_id = SecureRandom.urlsafe_base64(16, false)
    # invite_code = self.invite_code.present? ? self.invite_code : SecureRandom.urlsafe_base64(16, false)
    # set_analytics_logger
    # key = SecureRandom.hex(8)
    self.update(auth_token: session_token)
  end


  def self.find_for_authentication(params)
    user = User.find_by("users.email = ?", params[:email])
    return user if user.present? && user.valid_password?(params[:password])
    nil
  end

  def as_json(opt={})
    basic_attribute = self.slice(:id, :name, :email, :auth_token)
    return basic_attribute
  end
end
