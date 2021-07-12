class DishesController < ApplicationController
  before_action :set_dish, only: [:show]

  before_action :find_dish, only: [:reviews]
  skip_before_action :authenticate_user, only: [:create]

  before_action :authenticate_admin, only: [:create]


  def index
    @dishes = Dish.all

    render json: @dishes
  end

  def show
    render json: @dish
  end

  def create
    @dish = Dish.new(dish_params)

    if @dish.save
      render json: @dish, status: :created, location: @dish
    else
      render json: @dish.errors, status: :unprocessable_entity
    end
  end

  def reviews
    review = @dish.opinions.create(review: params[:review], user_id: @user.id, resturant_id: @resturant.id)
    if review.persisted? && review.errors.blank?
      render json: { message: 'Review added successfully', review: review}, status: 200
    else
      render json: { message: "Review adding Failed: #{review.errors.full_messages.join(',')}"}, status: 403
    end
  end


  def fetchreviews
    reviews = Opinion.where(dish_id: params[:dish])
    if reviews.present?
      render json: { message: 'Review listed successfully', review: reviews}, status: 200
    else
      render json: { message: 'No reviw found', review: []}, status: 200
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish
      @dish = Dish.find(params[:id])
    end

    def find_resturant
      @resturant = Resturant.find_by_id(params[:resturant_id])
    end

    def find_dish
      @dish = Dish.find_by_id(params[:dish_id])
      @resturant = Resturant.find_by_id(@dish.resturant_id)
    end

    # Only allow a list of trusted parameters through.
    def dish_params
      params.permit(
        :name,
        :resturant_id,
      );
    end
end
