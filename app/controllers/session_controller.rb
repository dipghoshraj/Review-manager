class SessionController < ApplicationController
    def create
        user = User.find_for_authentication(params)
        if user.present?
            user.create_session
            render json: { message: "Signed in Successfully", user: user}, status: 200
            #render json: { message: "Signed in Successfully", user: user, store_auth_token: nil }, status: 200
        else
        render json: { message: "Invalid Credentials. Login Failed" }, status: 405
        end
    end

    private

    def user_auth_params
      params.permit(:email, :password);
    end
end
