class PostComment < ApplicationRecord

  validates :comment, {length: {in: 1..200} }

  belongs_to :user
  belongs_to :post_image
end
