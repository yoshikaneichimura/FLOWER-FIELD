class Admin::PostImagesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images : PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    post_image = PostImage.find(params[:id])
    post_image.update(post_image_params)
    redirect_to admin_post_image_path(post_image.id)
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to admin_post_images_path
  end

  private

  def post_image_params
    params.require(:post_image).permit(:user_id,:tag_id,:flower,:field,:day,:star,:address,:detail,:image)
  end

end