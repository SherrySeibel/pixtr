class TagsController < ApplicationController
  def new
    @tag = Tag.new
  end

  def create
     tag = Tag.new(tag_params)

     if tag.save
       redirect_to [:new, :tag]
     else
       render :new
     end
  end

   private

   def tag_params
    params.
      require(:tag).
      permit(:tag_name,)
  end
end