class PostComment < ApplicationRecord
  
  validates :comment,  presence: true
  
  belongs_to :user
  belongs_to :post_image

end
