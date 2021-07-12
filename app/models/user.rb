class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_uniqueness_of :email

  after_create :invite


  
  def create_session
    session_token = SecureRandom.urlsafe_base64(128, false)
    self.update(auth_token: session_token)
  end

  def invite
    SendNewUserInvitationJob.perform_later(self.email)
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
