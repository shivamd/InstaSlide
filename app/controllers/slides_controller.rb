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
      redirect_to "/slideshow/#{@slide.secure_url}"
    else
      render :new
    end
  end

  def show
    @slide = Slide.find_by_secure_url(params[:secure_string])
    redirect_to root_url unless @slide
    @photos = @slide.photos
  end

end
