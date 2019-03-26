class GoodsController < ApplicationController
  before_action :authenticate_user!, :is_admin?, only: [:new, :edit, :update]
  before_action :set_categories, only: [:new, :edit, :create, :update]
  before_action :find_good, only:[:show, :destroy, :edit, :update]
  before_action :create_order_good, only:[:show, :index]

  def index
    if params[:good_categories_id].blank?
      @Goods = Good.all.order("created_at DESC")  # сортировка по алфавиту
    else
      @Category_good = GoodCategory.find_by(:id => params[:good_categories_id])
      @Goods = Good.where(:good_categories_id => @Category_good.id).order("created_at DESC")
    end
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def destroy
    @good.destroy
    redirect_to root_path, :flash => { :error => "Товар удален" }
  end

  def update
    if @good.update(good_params)
      redirect_to good_path(@good)
    else
      render 'edit'
    end
  end

  def create
    puts "ADSASDADADADADDADADADADADA"
    puts good_params
    @good = Good.new(good_params)
    @good.good_categories_id = params[:good_categories_id].to_i
    puts @good.good_categories_id
    if @good.save
      redirect_to root_path, :flash => { :error => "Товар добавлен" }
    else
      puts @good.errors.full_messages.to_sentence
      render 'new'
    end
  end

  def show
    @good=Good.find(params[:id])
  end

  private

  def set_categories
    @category_good = GoodCategory.all.map{ |c| [c.name, c.id]}
  end

  def good_params
    params.require(:good).permit(:name, :quantity, :price, :description, :photo, :good_categories_id, :short_description, :articul, :weight, :width, :length, :height)
  end

  def find_good
    @good=Good.find(params[:id])
  end

  def create_order_good
    @order_good = current_order.order_goods.new
    print(current_order.id)
  end
end
