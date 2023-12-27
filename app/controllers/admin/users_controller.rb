class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
        flash[:notice] = "ユーザー情報を更新しました"
        redirect_to admin_user_path(@user.id)
    else
        render :edit
    end
  end

  def search
    users = User.all.search(params[:search])
    @users = users.page(params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :is_active,:profile_image)
  end
end
