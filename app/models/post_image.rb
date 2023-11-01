class PostImage < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :tag

  def get_image(width,height)
    unless image.attached?
      file_path  = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path),filename: 'person.jpg',content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width,height]).processed
  end

  def self.search(search)
    if search
      PostImage.where(['flower LIKE ?',"%#{search}%"])
    else
      PostImage.all
    end
  end
end
