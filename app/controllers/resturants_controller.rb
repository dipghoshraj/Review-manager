class ResturantsController < ApplicationController
  before_action :set_resturant, only: [:show, :update, :destroy]
  skip_before_action :authenticate_user, only: [:create]

  before_action :authenticate_admin, only: [:create]

  def index
    @resturants = Resturant.all

    render json: @resturants
  end

  def show
    render json: @resturant
  end

  def create
    @resturant = Resturant.create(resturant_params)

    if @resturant.persisted? && @resturant.errors.blank?
      render json: { message: 'Resturant created successfully', user: @resturant}, status: 200
    else
      render json: { message: "Resturant created Failed: #{@resturant.errors.full_messages.join(',')}"}, status: 403
    end
  end

  def update
    if @resturant.update(resturant_params)
      render json: @resturant
    else
      render json: @resturant.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @resturant.destroy
  end

  private
    def set_resturant
      @resturant = Resturant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def resturant_params
      params.permit(
        :name,
        :specility,
        :location
      );
    end
end
