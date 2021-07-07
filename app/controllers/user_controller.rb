class UserController < ApplicationController
    def create
        @user = User.create(user_params)
        if @user.persisted? && @user.errors.blank?
          render json: { message: 'Signed up successfully', user: @user}, status: 200
        else
          render json: { message: "User Registration Failed: #{@user.errors.full_messages.join(',')}"}, status: 403
        end
    end

    private

    def user_params
        @user_object_params ||= params.permit(
          :name,
          :email,
          :password,
          :password_confirmation
        );
    end
end
