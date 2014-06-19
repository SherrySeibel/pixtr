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
    params_with_user_id = gallery_params.merge(
      user_id: current_user.id # user_id is a helper.
      )
    @gallery = Gallery.new(params_with_user_id)
    if @gallery.save
      redirect_to @gallery
    else 
      @gallery = gallery # views only have access to instance variables. 
      render :new # Renders a new template. Not in an action. 
      # Could redirect, but we want them to keep what they had before. 
    end
  end

  def edit
    # @gallery = Gallery.find(params[:id])
    # @gallery = current_user.galleries.find(params[:id])

    the_user = current_user
    galleries_owned_by_them = the_user.galleries
    @gallery = galleries_owned_by_them.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      redirect_to @gallery
    else
      render :edit
    end
  end

  def destroy
    gallery = Gallery.find(params[:id])
    gallery.destroy
    redirect_to "/"
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