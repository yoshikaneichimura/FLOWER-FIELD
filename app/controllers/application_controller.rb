class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    if user_signed_in?
      @search = PostImage.ransack(params[:q])
      @search_post_images = @search.result(distinct: true).order(created_at: :desc).page(params[:page])
    else admin_signed_in?
      @search = User.ransack(params[:q])
      @search_users = @search.result(distinct: true).order(created_at: :desc).page(params[:page])
    end
  end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end