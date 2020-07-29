class Api::V1::UsersController < Api::V1::ApiController 
  def profile

  end

  def update 
  end

  private 

  def set_user
    @user = current_user
  end


end
