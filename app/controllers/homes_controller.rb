class HomesController < ApplicationController
  def top
  end

  def about
  end

  # def guest_sign_in
  #   user = User.find_or_create_by!(email: 'guest@example.com') do |user|
  #     user.name = "ゲストユーザー"
  #     user.password = SecureRandom.urlsafe_base64
  #   end

  # sign_in user
  # redirect_to about_path, notice: 'ゲストユーザーとしてログインしました'
  # end

  def guest_admin_sign_in
    admin = Admin.find_or_create_by!(email: 'guest-admin@example.com') do |admin|
    admin.name = "ゲスト管理者"
    admin.password = SecureRandom.urlsafe_base64
    end

  sign_in admin
  redirect_to root_path, notice: 'ゲスト管理者としてログインしました'
  end
end
