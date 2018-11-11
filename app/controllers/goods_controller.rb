class GoodsController < ApplicationController
  before_action :authenticate_user!, :is_admin?, only: [:new]
  before_action :set_categories, only: [:new, :edit, :create]
  before_action :find_good, only:[:show, :destroy]

  def index
    if params[:good_categories_id].blank?
      @Goods = Good.all.order("created_at DESC")  # сортировка по алфавиту
    else
      @Category_good = GoodCategory.find_by(name: params[:good_categories_id]).id
      @Goods = Good.where(:good_categories_id => @category_good.id).order("created_at DESC")
    end
  end

  def new
    @good = Good.new
  end

  def edit
  end

  def show
  end

  def destroy
    @good.destroy
    redirect_to root_path
  end


  def create
    puts "ADSASDADADADADDADADADADADA"
    puts good_params
    @good = Good.new(good_params)
    @good.good_categories_id = params[:good_categories_id].to_i
    puts @good.good_categories_id
    if @good.save
      redirect_to root_path
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
    params.require(:good).permit(:name, :quantity, :price, :description, :photo, :good_categories_id, :short_description, :articul)
  end

  def find_good
    @good=Good.find(params[:id])
  end
end
