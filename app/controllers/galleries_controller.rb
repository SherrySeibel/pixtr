class GalleriesController < ApplicationController
  def index
   @galleries = Gallery.all
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  def new
    @gallery = Gallery.new
  end

  def create
    gallery = Gallery.create(gallery_params)
    redirect_to "/galleries/#{gallery.id}"
  end

  private

# This is creating STRONG params. The page can no longer be hacked.
  def gallery_params
    params.require(:gallery).permit(
      :name,
      :description,
      )
  end
end
