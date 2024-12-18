class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :guest_check, only: [:update]
  def index
    @users = User.active.sorted
  end

  def show
    @user = User.find(params[:id])
    @post_images = @user.post_images.page(params[:page]).sorted
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
        flash[:notice] = "ユーザー情報を更新しました。"
        redirect_to admin_user_path(@user.id)
    else
        render :edit
    end
  end

  def deleted
    @users = User.deleted.sorted
  end

  def guest_check
    @user = User.find(params[:id])
   if @user.email == 'guest@example.com'
      redirect_to admin_users_path,notice: "ゲストユーザーの情報の編集はできません。"
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :is_active,:profile_image)
  end
end