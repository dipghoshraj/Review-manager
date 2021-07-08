class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:create]

  def show
    render json: @admin
  end

  def create
    @admin = Admin.create(admin_params)
    if @admin.persisted? && @admin.errors.blank?
      render json: { message: 'Admin Signed up successfully', user: @admin}, status: 200
    else
      render json: { message: "User Registration Failed: #{@admin.errors.full_messages.join(',')}"}, status: 403
    end
  end

  private

  def set_admin
    @admin = Admin.find_by(id: params[:id])
  end

  def admin_params
    @user_object_params ||= params.permit(
      :name,
      :id,
      :email,
      :password,
      :password_confirmation
    );
  end
end
