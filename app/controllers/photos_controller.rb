class PhotosController < ApplicationController
	include ApiHelper
	respond_to :json
	def facebook_albums
		render json: fb_albums_info
	end

	def facebook_photos
		render json: fb_photos(params[:album_id])
	end

	def instagram_photos
		render json: ig_photos
	end

end
