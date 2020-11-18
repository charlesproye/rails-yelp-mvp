class RestaurantsController < ApplicationController
  before_action :find, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurants)
    if @restaurant.save
      @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private

  def params_restaurants
    params.require(:restaurant).permit(:name, :address, :category, :phone_number)
  end

  def find
    @restaurant = Restaurant.find(params[:id])
  end
end
