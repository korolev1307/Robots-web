class OrderGoodsController < ApplicationController
  before_action :good_params, only: [:create]

  def create
    @order = current_order
    if OrderGood.where(:order_id => @order.id).find_by(:good_id => params[:order_good][:good_id]).nil?
      @good = @order.order_goods.new(good_params)
      puts @good.good_id
      @order.user_id = current_user.id
      @order.save
      session[:order_id] = @order.id
      redirect_to goods_path
    else
      redirect_to cart_path
    end
  end

  def destroy
    @order = current_order
    @good = @order.order_goods.find(params[:id])
    @good.destroy
    @order.user_id = current_user.id
    @order.save
    redirect_to cart_path, :flash => { :error => "Товар удален из корзины" }
  end

  def update
    @order = current_order
    @good = @order.order_goods.find(params[:id])
    puts @good.good_id
    puts "//////////////////////"
    puts params[:item][:good_id]
    if params[:item][:quantity].to_i <= Good.find(params[:item][:good_id]).quantity.to_i
      @good.update_attribute(:quantity, params[:item][:quantity])
      @good.save
      @order.save
      redirect_to cart_path, :flash => { :notice => "Количество товаров в корзине обновлено" }
    else
      redirect_to cart_path, :flash => { :error => "Количество товаров превышает имеющееся количество товаров у нас на складе" }
    end
  end
  private

  def good_params
    params.require(:order_good).permit(:quantity, :good_id)
  end

end
