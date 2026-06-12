class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    if user_signed_in?
      @search_form = PostImage.ransack(params[:q])
      @search_post_images = @search_form.result(distinct: true).page(params[:page]).sorted
    else admin_signed_in?
      @search_form = User.ransack(params[:q])
      @search_users = @search_form.result(distinct: true).page(params[:page]).sorted
    end
  end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end