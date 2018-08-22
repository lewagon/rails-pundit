class RestaurantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = policy_scope(Restaurant)
  end

  def show
  end

  def new
    @restaurant = current_user.restaurants.new
    authorize @restaurant
  end

  def edit
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)
    authorize @restaurant

    if @restaurant.save
      redirect_to @restaurant
    else
      render :new
    end
  end

  def update
    @restaurant.update(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :description, :user_id)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
    authorize @restaurant
  end
end
