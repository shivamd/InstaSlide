class SlidesController < ApplicationController
	before_filter :redirect_unless_signed_in
	respond_to :json
	include ApiHelper
	def index
	end

	def new
		@slide = current_user.slides.build
		photo = @slide.photos.build
	end

	def create
		@slide = current_user.slides.build(params[:slide])
		if @slide.save
			@slide.add_photos(params[:photos], current_user.id)
		else
			render :new
		end
	end

	def facebook_albums
		render json: fb_albums_info
	end

	def facebook_photos
		render json: fb_photos(params[:album_id])
	end


end
