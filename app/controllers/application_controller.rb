class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

protected

     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :address, :city, :state, :email, :phonenumber, :password)}

          devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :address, :city, :state, :email, :phonenumber, :password, :current_password)}
        end
end
