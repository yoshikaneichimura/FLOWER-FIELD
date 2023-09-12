class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path
    when User
      about_path
    end
  end

  def after_sign_out_path_for(resource)
    case resource
    when :admin
      root_path
    when :user
      about_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
