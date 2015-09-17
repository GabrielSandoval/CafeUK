class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_up) << :first_name
        devise_parameter_sanitizer.for(:sign_up) << :last_name
        devise_parameter_sanitizer.for(:sign_up) << :age
        devise_parameter_sanitizer.for(:sign_up) << :location
        devise_parameter_sanitizer.for(:sign_up) << :bio
        
        devise_parameter_sanitizer.for(:account_update) << :first_name
        devise_parameter_sanitizer.for(:account_update) << :last_name
        devise_parameter_sanitizer.for(:account_update) << :age
        devise_parameter_sanitizer.for(:account_update) << :location
        devise_parameter_sanitizer.for(:account_update) << :bio
  end

end
