class User::UsersController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_user_path
  end

  def unsubscribe
    @user = current_user
  end

  def withdraw
    user = current_user
    user.update(is_active: false)
    reset_session
    redirect_to about_path

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)

  end

end
