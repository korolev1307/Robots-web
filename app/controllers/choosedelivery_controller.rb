class ChoosedeliveryController < ApplicationController
  before_action :check_city
  before_action :setup_data
  before_action :setup_order
  require 'digest/md5'
  require 'json'
  def new

  end

  def update
      if @order.update(delivery_params)
        redirect_to paymenttype_index_path
      end
  end

  private

  def check_city
    if current_order.receiverCityId.nil?
      redirect_to deliverycity_index_path, :flash => { :error => "Выберите город" }
    end
  end

  def setup_data
    @receiverCityId = current_order.receiverCityId
    gon.receiverCityId = @receiverCityId
    @secure_key=Digest::MD5.hexdigest(Date.today.to_s + "&" + "rbpalICHSxxZ6bCZjA02PCdOOfYPcRnE")
    gon.secure_key = @secure_key
    @current_date = Date.today.to_s
    gon.current_date = @current_date
    

    @goods_params = []
    @order_goods = current_order.order_goods.all
    @order_goods.each do |good|
      @goods_params.push(
        "{\
        \"weight\": \"#{Good.find(good.good_id).weight}\",\
        \"length\": \"#{Good.find(good.good_id).length}\",\
        \"width\": \"#{Good.find(good.good_id).width}\",\
        \"height\": \"#{Good.find(good.good_id).height}\"\
}")
    end
    puts @goods_params
    gon.goods_params = @goods_params

    # @city = City.find(current_order.cities_id)
    # goods = current_order.order_goods
    # full_weight = goods.inject(0){|sum, good| sum + Good.find(good.good_id).weight * good.quantity }.ceil
    # puts full_weight
    # if @city.max_weight_ss > full_weight
    #   @price_ss = @city.min_price_ss
    # else
    #   @price_ss = @city.min_price_ss + (full_weight - @city.max_weight_ss) * @city.kg_price_ss
    # end
    #  if @city.max_weight_sd > full_weight
    #   @price_sd = @city.min_price_sd
    # else
    #   @price_sd = @city.min_price_sd + (full_weight - @city.max_weight_sd) * @city.kg_price_sd
    # end
  end

  def setup_order
    @order = current_order
  end

  def delivery_params
    params.require(:order).permit(:delivery_type, :total_price, :delivery_date, :tariffId)
  end
end
