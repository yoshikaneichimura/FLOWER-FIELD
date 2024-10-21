class User::RelationshipsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    users = @user.followings
    @users = users.sorted
  end

  def followers
    @user = User.find(params[:user_id])
    users = @user.followers
    @users = users.sorted
  end
end