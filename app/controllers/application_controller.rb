class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_order
  before_action :all_categories
  helper_method :current_user

  def current_user
    super || guest_user
  end

  def current_order
    order = Order.find_by_user_id(current_user.id)
    if order.nil?
       order = Order.new
    end
    order
  end

  def all_categories
    @all_categories = GoodCategory.all
  end

  protected

    def guest_user
      User.find(session[:guest_user_id].nil? ? session[:guest_user_id] = create_guest_user.id : session[:guest_user_id])
    end

    def create_guest_user
      user = User.new { |user| user.guest = true }
      user.email = "guest_#{Time.now.to_i}_#{rand(99)}@example.com"
      user.save(:validate => false)
      user
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :patronymic, :email, :password, :password_confirmation, :organisation, :telephone) }      
    end

    def is_admin?
      redirect_to root_path, :flash => { :error => "У вас нет доступа" } unless current_user.admin?
    end
end
