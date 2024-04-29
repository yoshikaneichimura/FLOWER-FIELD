class PostComment < ApplicationRecord

  validates :comment,  {length: {maximum:200} }

  belongs_to :user
  belongs_to :post_image
end
