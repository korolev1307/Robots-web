class DeliverycityController < ApplicationController

  before_action :all_cities
  before_action :find_order
  def new
  end

  def update
    puts params[:order][:receiverCityId]
    unless params[:order][:receiverCityId].nil? && @order.nil?
  	  @order.receiverCityId = params[:order][:receiverCityId]
  	  @order.save

      redirect_to choosedelivery_index_path
  	end
  end
  private

  def all_cities
  	#@cities = City.all.map{ |c| [c.delivery_city, c.id]}
  end

  def city_params
    params.require(:order).permit(:receiverCityId)
  end

  def find_order
    @order = current_order
  end
end
