class Api::V1::FlightsController < ApplicationController
  before_action :find_flight, only: [:update]
  def index
    @flights = Flight.all
    render json: @flights
  end

  def update
    @flight.update(flight_params)
    if @flight.save
      render json: @flight, status: :accepted
    else
      render json: { errors: @flight.errors.full_messages }, status: :unprocessible_entity
    end
  end

  private

  def flight_params
    params.permit(:name, :email, :password)
  end

  def find_flight
    @flight = Flight.find(params[:id])
  end
end
