class PostImage < ApplicationRecord

  has_one_attached :image

  validates :flower,  {length: {in: 1..20} }
  validates :field,   {length: {in: 1..20} }
  validates :day,     presence: true
  validates :star,    presence: true
  validates :address,  {length: {maximum:50} }
  validates :detail,  {length: {maximum:200} }

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
    ["flower","field","day","address","detail"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["name","introduction"]
  end

  scope :sorted, -> { order(created_at: :desc) }
  scope :active_post, -> { includes(:user, image_attachment:[:blob]).joins(:user).merge(User.active).sorted }
end