class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_devise_params, if: :devise_controller?

 
#attributes to update for the user model. 
  def configure_devise_params
    [:sign_up, :account_update].each do |action|
      devise_parameter_sanitizer.for(action) do |u|
        u.permit(:first_name, :last_name,  :email, :password, :password_confirmation, :current_password, :remote_user_image_url, :user_image)
      end
    end
  end

 

end
