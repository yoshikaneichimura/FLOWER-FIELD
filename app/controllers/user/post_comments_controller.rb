class User::PostCommentsController < ApplicationController

  def create
    @post_image = PostImage.find(params[:post_image_id])
    comment = PostComment.new(post_comment_params)
    comment.user_id = current_user.id
    comment.post_image_id = @post_image.id
    redirect_to user_post_image_path(@post_image)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:user_id,:post_image_id,:comment)
  end
end
