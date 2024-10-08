class HomesController < ApplicationController
  before_action :forbid_login_user

  def top
  end

  def about
  end

  protected

  def forbid_login_user
    if user_signed_in?
      redirect_to user_user_path(current_user.id)
      flash[:alert] = "すでにログインしています。"
    elsif admin_signed_in?
      redirect_to admin_users_path
      flash[:alert] = "すでにログインしています。"
    end
  end
end