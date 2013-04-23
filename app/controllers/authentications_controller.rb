class AuthenticationsController < ApplicationController

	def index
	end

	def create
		omniauth = request.env["omniauth.auth"]
		auth = Authentication.from_omniauth(omniauth)
		if auth 
			session[:user_id] = auth.user_id
		elsif current_user 
		  current_user.authentications.create!(provider: omniauth['provider'], uid: omniauth['uid'], access_token: omniauth.credentials.token)
		else
			user = User.new(name: omniauth.info.name)
		  user.authentications.build(provider: omniauth['provider'], uid: omniauth['uid'], access_token: omniauth.credentials.token)
		  user.save!
		end
		redirect_to root_url
	end

	def destroy
	end

end