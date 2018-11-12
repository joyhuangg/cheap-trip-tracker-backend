# require 'rest-client'
# require 'json'
# require 'pry'

class Api::V1::RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all
    render json: @restaurants
  end


 # to do fetch this from front end fetch restaurants here from yelp and return
  def yelp_restaurants
    render json: Restaurant.fetch_restaurants(params['lon'], params['lat'])
  end

   def show
     @restaurant = Restaurant.find(params[:id])
     render json: @restaurant
   end


   def create
      @restaurant = Restaurant.find_or_create_by(restaurant_params)
      if @restaurant.save
        render json: RestaurantSerializer.new(@restaurant), status: :created
      else
        byebug
        render json: {error: 'Failed to create restaurant'}, status: :not_acceptable
      end
   end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(restaurant_params)
    if @restaurant.save
      render json: @restaurant, status: :accepted
    else
      render json: { errors: @restaurant.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    render status: :accepted
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:image_url, :cuisines, :name, :url, :rating, :longitude, :latitude, :address, :price)
  end

end
