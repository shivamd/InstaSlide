class SessionsController < ApplicationController

  def destroy
  	session.clear
  	redirect_to root_url
  end
end
