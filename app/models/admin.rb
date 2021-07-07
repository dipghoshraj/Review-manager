class Admin < ApplicationRecord

    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

    validates_uniqueness_of :email

    def self.find_for_authentication(params)
        admin = Admin.find_by("admins.email = ?", params[:email])
        return admin if admin.present? && admin.valid_password?(params[:password])
        nil
    end
    
    def create_session
        session_token = SecureRandom.urlsafe_base64(128, false)
        self.update(auth_token: session_token)
    end

    def as_json(opt={})
        basic_attribute = self.slice(:id, :name, :email, :auth_token)
        return basic_attribute
    end
end
