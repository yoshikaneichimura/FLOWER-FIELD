class Admin::RelationshipsController < ApplicationController
  before_action :authenticate_admin!

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