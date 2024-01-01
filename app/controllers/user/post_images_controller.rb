class User::PostImagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @post_image = PostImage.new
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      flash[:notice] = "投稿しました"
      redirect_to user_post_image_path(@post_image.id)
    else
      render :new
    end
  end

  def index
    @q = PostImage.ransack(params[:q])
    post_images = @q.result(distinct: true)
    @post_images = params[:tag_id].present? ? Tag.find(params[:tag_id]).post_images.page(params[:page]) : post_images.page(params[:page])
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def edit
    @post_image = PostImage.find(params[:id])
  end

  def update
    @post_image = PostImage.find(params[:id])
    if @post_image.update(post_image_params)
      flash[:notice] = "投稿内容を編集しました"
      redirect_to user_post_image_path(@post_image.id)
    else
      render :edit
    end
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to user_post_images_path
  end

  def search
    post_images = PostImage.search(params[:search])
    @post_images = post_images.page(params[:page])
  end

  private

  def post_image_params
    params.require(:post_image).permit(:user_id,:tag_id,:flower,:field,:day,:star,:address,:detail,:image)
  end
end
