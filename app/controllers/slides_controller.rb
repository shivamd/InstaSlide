class SlidesController < ApplicationController
	before_filter :redirect_unless_signed_in
	def index 
	end

	def new
		@slide = current_user.slides.build
	end

	def create
	end


end