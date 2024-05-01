class User::PostCommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post_image = PostImage.find(params[:post_image_id])
    comment = current_user.post_comments.new(post_comment_params)
    comment.post_image_id = @post_image.id
    if comment.save
      flash[:notice] = "コメントを投稿しました"
      redirect_to user_post_image_path(@post_image)
    else
      @error_comment = comment
      @post_image = PostImage.find(params[:post_image_id])
      @user = @post_image.user
      @post_comment = PostComment.new
      render 'user/post_images/show'
    end
  end

  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to user_post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
