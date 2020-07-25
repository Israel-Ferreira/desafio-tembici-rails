# frozen_string_literal: true

class Api::V1::TravelsController < Api::V1::ApiController
  before_action :set_travel, only: %i[end_travel show]

  def index
    @travels = current_user.travels
    render json: @travels
  end

  def create
    if current_user.has_active_travels?
      error_msg = { message: 'Essa viagem não foi liberada, pois você tem viagens em andamento' }
      render json: error_msg, status: :not_acceptable
    else
      @travel = current_user.travels.build
      if @travel.save!
        render json: { message: 'Travel created successful' }, status: :created
      else
        send_errors(@travel)
      end
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
    params.require(:travel).permit(:category_id, :grade)
  end
end
