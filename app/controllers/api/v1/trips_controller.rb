class Api::V1::TripsController < ApplicationController
  before_action :find_trip, only: [:update, :show, :destroy]

  def index
    @trips = Trip.all
    render json: @trips
  end

  def show
    render json: @trip
  end


  def create
     @trip = Trip.new(trip_params)
     if @trip.save
       render json: TripSerializer.new(@trip), status: :created
     else
       byebug
       render json: {error: 'Failed to create trip'}, status: :not_acceptable
     end
  end

  def update
    @trip.update(trip_params)
    if @trip.save
      render json: @trip, status: :accepted
    else
      render json: { errors: @trip.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @trip.destroy
    render status: :accepted
  end

  private

  def trip_params
    params.require(:trip).permit(:name, :user_id, :location, :start_date, :end_date, :num_ppl, :price, :longitude, :latitude)
  end

  def find_trip
    @trip = Trip.find(params[:id])
  end
end
