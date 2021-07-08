class UserController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]
  before_action :set_user, only: [:show]
    def create
        @user = User.create(user_params)
        if @user.persisted? && @user.errors.blank?
          render json: { message: 'Signed up successfully', user: @user}, status: 200
        else
          render json: { message: "User Registration Failed: #{@user.errors.full_messages.join(',')}"}, status: 403
        end
    end

    def show
      render json: { message:'user details', user: @user}, status:200
    end

    private

    def set_user
      @user = User.find_by(id: params[:id])
    end

    def user_params
      @user_object_params ||= params.permit(
        :name,
        :email,
        :password,
        :password_confirmation
      );
    end
end
