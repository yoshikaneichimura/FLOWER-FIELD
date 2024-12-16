class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストユーザー"
    end
  end

  has_one_attached :profile_image

  validates :name,  {length: {in: 1..20} }
  validates :introduction, {length: {maximum:100} }

  has_many :post_images, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id",dependent: :destroy

  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  def follow(user_id)
    relationships.create(followed_id: user_id)
  end

  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end

  def following?(user)
    followings.include?(user)
  end

  def get_profile_image(width,height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpeg')
      profile_image.attach(io: File.open(file_path), filename: 'person.jpg',content_type: 'image/jpeg' )
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.ransackable_attributes(auth_object = nil)
    ["name","introduction"]
  end

  def self.ransackable_associations(auth_object = nil)
     ["flower","field","address","detail"]
  end

  scope :include, -> { includes(profile_image_attachment:[:blob]) }
  scope :active,  -> { where(is_active: "true") }
  scope :deleted, -> { where(is_active: "false")}
  scope :sorted,  -> { order(created_at: :desc).include }
  scope :recent,  -> { active.sorted }

end