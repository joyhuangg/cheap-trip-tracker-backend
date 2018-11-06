class Api::V1::TripRestaurantsController < ApplicationController

    before_action :find_trip_restaurant, only: [:update, :show, :destroy]

    def index
      @trip_restaurants = TripRestaurant.all
      render json: @trip_restaurants
    end

    def show
      render json: @trip_restaurant
    end


    def create
       @trip_restaurant = TripRestaurant.new(trip_restaurant_params)
       if @trip_restaurant.save
         render json: @trip_restaurant, status: :created
       else
         byebug
         render json: {error: 'Failed to create trip_restaurant'}, status: :not_acceptable
       end
    end

    def update
      @trip_restaurant.update(trip_restaurant_params)
      if @trip_restaurant.save
        render json: @trip_restaurant, status: :accepted
      else
        render json: { errors: @trip_restaurant.errors.full_messages }, status: :unprocessible_entity
      end
    end

    def destroy
      @trip_restaurant.destroy
      render status: :accepted
    end

    private

    def trip_restaurant_params
      params.require(:trip_restaurant).permit(:trip_id, :restaurant_id)
    end

    def find_trip_restaurant
      @trip_restaurant = TripRestaurant.find(params[:id])
    end
end
