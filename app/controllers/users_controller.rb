class UsersController < ApplicationController
	before_action :authenticate_user!
 
  def show
    
  end

  def index
    @orders = Order.where(:user_id => current_user.id).all
    @users = User.all
  end

  private

  def set_user

  end

  def parse_params

  end
end
