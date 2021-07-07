class ApplicationController < ActionController::API
    before_action :authenticate_user

    def authenticate_user
      unless (auth_token=request.headers["HTTP_AUTH_TOKEN"]).present? && (@user=User.find_by(auth_token: auth_token)).present? && sign_in(@user, store: false)
        render json: { message: "Please Sign in to continue." }, status: 401
        return false
      end
    end
  
    def authenticate_admin
      unless (auth_token=request.headers["HTTP_AUTH_TOKEN"]).present? && (@admin=Admin.find_by(auth_token: auth_token)).present?
        render json: { message: "Please Sign in as Admin to continue." }, status: 401
        return false
      end
    end
end
