class Admin::PostCommentsController < ApplicationController

  def destroy
    PostComment.find(params[:id]).destroy
    flash[:notice] = "コメントを削除しました"
    redirect_to admin_post_image_path(params[:post_image_id])
  end
end
