class PostComment < ApplicationRecord

  validates :comment, {length: {in: 1..200} }

  belongs_to :user
  belongs_to :post_image

  def self.ransackable_attributes(auth_object = nil)
    ["comment"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["user","post_image"]
  end
end
