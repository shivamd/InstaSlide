class ApplicationController < ActionController::Base
  protect_from_forgery
  include UserHelper

  def redirect_unless_signed_in
  	redirect_to root_url, notice: "Please sign in" unless signed_in?
  end

end
