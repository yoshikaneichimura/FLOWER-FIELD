class PostImage < ApplicationRecord

  has_one_attached :image

  validates :flower,  presence: true
  validates :field,   presence: true
  validates :day,     presence: true
  validates :star,    presence: true

  belongs_to :user
  belongs_to :tag
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def get_image(width,height)
    unless image.attached?
      file_path  = Rails.root.join('app/assets/images/no_image.jpeg')
      image.attach(io: File.open(file_path),filename: 'person.jpg',content_type: 'image/jpeg')
    end
      image.variant(resize_to_limit: [width,height]).processed
  end

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    ["flower","field","address","detail"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["name","introduction"]
  end
end

