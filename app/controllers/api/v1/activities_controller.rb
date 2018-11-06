class Api::V1::ActivitiesController < ApplicationController
  before_action :find_activity, only: [:update, :show, :destroy]
  def index
    @activities = Activity.all
    render json: @activities
  end

  def show
    render json: @activity
  end


  def create
     @activity = Activity.new(activity_params)
     if @activity.save
       render json: ActivitySerializer.new(@activity), status: :created
     else
       byebug
       render json: {error: 'Failed to create activity'}, status: :not_acceptable
     end
  end

  def update
    @activity.update(activity_params)
    if @activity.save
      render json: @activity, status: :accepted
    else
      render json: { errors: @activity.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
    @activity.destroy
    render status: :accepted
  end
  private

  def activity_params
    params.permit(:title, :link, :snippet, :trip_id)
  end

  def find_activity
    @activity = Activity.find(params[:id])
  end
end
