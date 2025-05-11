class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  # before_action :set_current_user

  # def set_current_user
  # Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  # end

  # def authenticate
  #   redirect_to new_session_path, alert: "You must be logged in to access this page" unless Current.user
  # end

  #   def start_new_session_for(user)
  #     session[:user_id] = user.id
  #     Current.user = user
  #   end
  #
  #   def terminate_session
  #     session[:user_id] = nil
  #     Current.user = nil
  #   end
end
