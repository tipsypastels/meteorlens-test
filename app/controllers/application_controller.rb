class ApplicationController < ActionController::Base
  before_action :configure_permitted_params, if: :devise_controller?

  def configure_permitted_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  end

  def current_user?(user)
    current_user && current_user == user
  end
  helper_method :current_user?

  def fetch_feed(feed)
    feed.for(current_user, params[:page])
  end
end
