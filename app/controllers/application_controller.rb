class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource)
		tweets_path
	end
   
    #def current_user
	#	return unless session[:user_id]
	#	@current_user ||= User.find(session[:user_id])
	#end
   
    protected
      def configure_permitted_parameters
        devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:username, :userId, :email, :password, :password_cofirmation, :remember_me, :image, :image_cache) } 
	    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :userId, :email, :password, :password_cofirmation, :remember_me, :image, :image_cache) }
	    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :userId, :email, :password, :password_cofirmation, :remember_me, :image, :image_cache) }
      end
  
end
