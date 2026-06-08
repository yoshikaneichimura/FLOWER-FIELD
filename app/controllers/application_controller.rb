class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    if user_signed_in?
      @search = PostImage.ransack(params[:q])
      if params[:q].present? && params[:q][:flower_or_field_or_day_or_address_or_detail_or_tag_area_cont].present?
        key_words = params[:q][:flower_or_field_or_day_or_address_or_detail_or_tag_area_cont].split(/[\p{blank}\s]+/)
        grouping_hash = key_words.reduce({}) do |hash, word|
          hash.merge(word => { flower_or_field_or_day_or_address_or_detail_or_tag_area_cont: word})
        end
      end
      @search = PostImage.ransack({
        combinator: "and",
        groupings: grouping_hash
        })
      @search_post_images = @search.result(distinct: true).page(params[:page]).sorted
    else admin_signed_in?
      # @search = PostImage.ransack(params[:q])
      # @search_post_images = @search.result(distinct: true).page(params[:page]).sorted
       @search = User.ransack(params[:q])
      if params[:q].present? && params[:q][:name_or_introduction_or_post_comments_comment_cont].present?
        key_words = params[:q][:name_or_introduction_or_post_comments_comment_cont].split(/[\p{blank}\s]+/)
        grouping_hash = key_words.reduce({}) do |hash, word|
          hash.merge(word => { name_or_introduction_or_post_comments_comment_cont: word})
        end
      end
      @search = User.ransack({
        combinator: "and",
        groupings: grouping_hash
        })
      @search_users = @search.result(distinct: true).page(params[:page]).sorted
    end
  end

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  # end
end