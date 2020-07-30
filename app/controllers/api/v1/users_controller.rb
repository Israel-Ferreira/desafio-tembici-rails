# frozen_string_literal: true

class Api::V1::UsersController < Api::V1::ApiController
  before_action :password_verify, only: [:update]
  before_action :set_user, only: %i[profile update]

  def profile
    render json: @user
  end

  def update
    if @user.update(user_params)
      render json: @user, status: :ok
    else
      render json: @user.errors, status: :bad_request
    end
  end

  private

  def set_user
    @user = current_user
  end

  def password_verify
    if params[:user][:password].blank? && params[:user][:password_confirmation]
      params[:user].extract(:password, :password_confirmation)
    end
  end

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
