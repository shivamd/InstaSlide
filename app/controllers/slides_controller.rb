class SlidesController < ApplicationController
	before_filter :redirect_unless_signed_in
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
			redirect_to @slide
		else
			render :new
		end
	end

	def show
		@slide = Slide.find(params[:id])
		@photos = @slide.photos
	end

end
