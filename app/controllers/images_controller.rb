class ImagesController < ApplicationController
  def show
    @image = Image.find(params[:id])
  end
  def new
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    @gallery = current_user.galleries.find(params[:gallery_id])
    @image = @gallery.images.find(image_params)

    if @image.save
      redirect_to @gallery
    else
      render :new
    end
  end

  def edit
    @image = current_user.images.find(params[:id])
  end

def update
    @image = current_user.images.find(params[:id])

    if @image.update(image_params)
      redirect_to @image.gallery
    else
      render :edit
    end
  end

    def destroy
    gallery = current_user.galleries.find(params[:gallery_id])
    image = gallery.images.find(params[:id])
    image.destroy
    redirect_to gallery
  end

  private

  def image_params
    params.
      require(:image).
      permit(:url)


      # { url: http://s3-ec.buzzfed.com/static/enhanced/terminal05/2012/7/31/15/anigif_enhanced-buzz-5806-1343761383-2.gif }
      # after merge.... { url: http://s3-ec.buzzfed.com/static/enhanced/terminal05/2012/7/31/15/anigif_enhanced-buzz-5806-1343761383-2.gif
      # gallery_id: 1 }
      #
  end
end
