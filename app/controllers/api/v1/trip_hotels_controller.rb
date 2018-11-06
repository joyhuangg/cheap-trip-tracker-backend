class Api::V1::TripHotelsController < ApplicationController

  before_action :find_trip_hotel, only: [:update, :show, :destroy]

  def index
    @trip_hotels = TripHotel.all
    render json: @trip_hotels
  end

  def show
    render json: @trip_hotel
  end


  def create
     @trip_hotel = TripHotel.new(trip_hotel_params)
     if @trip_hotel.save
       render json: {trip_hotel:@trip_hotel}, status: :created
     else
       byebug
       render json: {error: 'Failed to create trip_hotel'}, status: :not_acceptable
     end
  end

  def update
    @trip_hotel.update(trip_hotel_params)
    if @trip_hotel.save
      render json: @trip_hotel, status: :accepted
    else
      render json: { errors: @trip_hotel.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @trip_hotel.destroy
    render status: :accepted
  end

  private

  def trip_hotel_params
    params.require(:trip_hotel).permit(:trip_id, :hotel_id)
  end

  def find_trip_hotel
    @trip_hotel = TripHotel.find(params[:id])
  end
end
