# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  before_action :user_state, only: [:create]
  before_action :forbid_login_user, only: [:new]

  def new
  end

  def after_sign_in_path_for(resource)
    user_user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    about_path
  end

  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_user_path(user.id), notice: 'ゲストユーザーとしてログインしました。'
  end

  private

  def user_state
    user = User.find_by(email: params[:user][:email])
    return if user.nil?
    return unless user.valid_password?(params[:user][:password])
    return if user.is_active == true
    reset_session
    flash[:notice] = "退会済みです。再度ご登録をしてからご利用下さい。"
    redirect_to new_user_registration_path
  end

  def forbid_login_user
    if current_user
      redirect_to user_user_path(current_user.id)
    end
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end