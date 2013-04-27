class AuthenticationsController < ApplicationController

	def index
		@authentications = current_user.authentications if current_user
	end

	def create
		omniauth = request.env["omniauth.auth"]
		auth = Authentication.from_omniauth(omniauth)
		if auth
			session[:user_id] = auth.user_id
		elsif current_user
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
