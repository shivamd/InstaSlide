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
			#flash success and redirect to a page where they can add photos
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
