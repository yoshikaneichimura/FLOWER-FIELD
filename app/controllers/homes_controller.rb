class HomesController < ApplicationController
  def top
    @post_images = PostImage.all.order(create_at: :desc)
  end

  def about
  end

end
