class PaymenttypeController < ApplicationController
  before_action :find_order
  before_action :check_steps_before
  
  def index
    unless params[:payment_type].blank?
      if @order.update(:payment_type => params[:payment_type])
        redirect_to orderinfo_index_path
      end
    end
  end

  private

  def check_steps_before
  	if @order.receiverCityId.nil?
  	  redirect_to deliverycity_index_path, :flash => { :error => "Выберите город" }
  	else
      if @order.delivery_type.nil?
      	redirect_to choosedelivery_index_path, :flash => { :error => "Выберите способ получения товара"}
      end
    end
  end

  def payment_params
    params.require(:order).permit(:payment_type)
  end

  def find_order
  	@order = current_order
  end
end
#0-онлайн оплата
#1-оплата наличными курьеру
#2-оплата в пункте самовывоза сдэк
#3-оплата в пункте самовывоза
