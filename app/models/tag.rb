class Tag < ApplicationRecord
  has_many :post_images, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["area"]
  end

  def self.ransackable_associations(auth_object = nil)
     ["post_image"]
  end
end
