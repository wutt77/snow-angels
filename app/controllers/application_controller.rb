class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_action :configure_permitted_parameters, if: :devise_controller?

  # if admin.isAdmin==true
  # # get to the dashboard
  # else
  # #redirect to homepage.
  # end

  # before_filter :is_admin?, :only => [:new, :create]

   def configure_permitted_parameters
     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :email, :password, :password_confirmation, :mobile, :first_name, :last_name, :address, :post_code) }
     devise_parameter_sanitizer.for(:update) { |u| u.permit( :email, :password, :password_confirmation, :mobile, :first_name, :last_name, :address, :post_code) }
   end
end
