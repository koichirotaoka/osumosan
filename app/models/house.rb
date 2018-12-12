class House < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :deposit, presence: true, length: { maximum: 255 }
  validates :gratuityfee, presence: true, length: { maximum: 255 }
  validates :location, presence: true, length: { maximum: 255 }
  validates :access, presence: true, length: { maximum: 255 }
  validates :area, presence: true, length: { maximum: 255 }
  validates :age, presence: true, length: { maximum: 255 }
  validates :layout, presence: true, length: { maximum: 255 }
  validates :lightning, presence: true, length: { maximum: 255 }
  validates :service, presence: true, length: { maximum: 255 }
  validates :hashtag, presence: true, length: { maximum: 255 }
  
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_one :vendor, inverse_of: :house
  
  mount_uploader :image, ImageUploader
  
end
