class SlidesController < ApplicationController
	before_filter :redirect_unless_signed_in
	def index 
	end

	def new
		@slide = current_user.slides.build
	end

	def create
		@slide = current_user.slides.build(params[:slide])
		if @slide.save
			#flash success and redirect to a page where they can add photos
		else
			render :new
		end
	end


end