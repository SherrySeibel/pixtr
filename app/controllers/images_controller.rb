class ImagesController < ApplicationController
  def new
    @gallery = Gallery.find(params[:gallery_id])
    @image = Image.new
  end

  def create
    image = Image.create(image_params)
    gallery = Gallery.find(params[:gallery_id])
    redirect_to "/galleries/#{gallery.id}"
  end

  private

  def image_params
    params.
      require(:image).
      permit(:url).
      merge(gallery_id: params[:gallery_id])

      # { url: http://s3-ec.buzzfed.com/static/enhanced/terminal05/2012/7/31/15/anigif_enhanced-buzz-5806-1343761383-2.gif } 
      # after merge.... { url: http://s3-ec.buzzfed.com/static/enhanced/terminal05/2012/7/31/15/anigif_enhanced-buzz-5806-1343761383-2.gif 
      # gallery_id: 1 }
      # 
  end
end
