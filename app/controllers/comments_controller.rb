class CommentsController < ApplicationController
  def create
    @image = Image.find(params[:image_id])  # Not scoped because you can fimd and comment on any image.
    @comment = @image.comments.new(comment_params) #comments is plural because it HAS_MANY
    @comment.image = @image

    if @comment.save
      redirect_to @image
    else
      @comments = @image.comments.recent
      render "images/show" # can hardcode because it's a path to a template.
    end
  end

  private

  def comment_params
    params.require(:comment).permit(
      :body,
    ).merge(user_id: current_user.id)
  end
end
