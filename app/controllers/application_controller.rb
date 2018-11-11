class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :surname, :patronymic, :email, :password, :password_confirmation, :organisation, :telephone) }      
    end

    def is_admin?
      redirect_to root_path, :flash => { :error => "You don't have permission to access" } unless current_user.admin?
    end
end
