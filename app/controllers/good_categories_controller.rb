class GoodCategoriesController < ApplicationController
  before_action :authenticate_user!, :is_admin?, only: [:new, :create]
  
  def new
  	@category = GoodCategory.new
  end

  def create
    @category = GoodCategory.new(category_params)
    if @category.save
      redirect_to root_path
    else
      puts @category.errors.full_messages.to_sentence
      render 'new'
    end
  end

  private

  def category_params
    params.require(:good_category).permit(:name)
  end
end
