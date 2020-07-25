# frozen_string_literal: true

class Api::V1::TravelsController < Api::V1::ApiController
  before_action :set_travel, only: %i[end_travel show]

  def index
    @travels = current_user.travels
    render json: @travels
  end

  def create
    if Travel.create!(user: current_user)
      render json: { message: 'Travel created successful' }, status: :created
    else
      render json: { message: 'Travel Fails to Create' }, status: :unprocessable_entity
    end
  end

  def end_travel
    @travel.end_date = DateTime.now
    @travel.active = false

    if @travel.update(travel_params)
      render json: { message: 'Travel ended successful' }
    else
      send_errors(@travel)
    end
  end

  private

  def set_travel
    @travel = Travel.find(params[:id])
  end

  def travel_params
    params.require(:travel).permit(:category_id)
  end
end
