class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
  	!current_user.nil?
  end

  def redirect_unless_signed_in
  	redirect_to root_url, notice: "Please sign in" unless signed_in?
  end

  helper_method :current_user
end
