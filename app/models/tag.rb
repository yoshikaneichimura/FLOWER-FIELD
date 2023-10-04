class Tag < ApplicationRecord
  has_many :post_images, dependent: :destroy
end
