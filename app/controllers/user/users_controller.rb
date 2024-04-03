class User::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @users = User.order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      flash[:notice] = "ユーザー情報を更新しました"
      redirect_to user_user_path
    else
        render :edit
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理をしました"
    redirect_to about_path
  end

  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:post_image_id)
    post_images = PostImage.find(favorites)
    @favorites = Kaminari.paginate_array(post_images).page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :is_active, :profile_image)
  end
end
