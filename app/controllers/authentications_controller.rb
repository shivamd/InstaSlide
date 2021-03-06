class AuthenticationsController < ApplicationController

	def index
		@authentications = current_user.try(:authentications)
	end

	def create
		omniauth = request.env["omniauth.auth"]
		auth = Authentication.from_omniauth(omniauth)
		if auth
			session[:user_id] = auth.user_id
		elsif signed_in?
		  current_user.authentications.create!(provider: omniauth['provider'], uid: omniauth['uid'], access_token: omniauth.credentials.token)
		else
			user = User.create(name: omniauth.info.name)
		  user.authentications.create(provider: omniauth['provider'], uid: omniauth['uid'], access_token: omniauth.credentials.token)
		end
		redirect_to root_url
	end

	def destroy
	end

end
