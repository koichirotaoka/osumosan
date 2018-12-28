class House < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 
  validates :location, presence: true, length: { maximum: 255 }
  validates :access, presence: true, length: { maximum: 20 }
  validates :rent, numericality: { only_integer: true }, length: { maximum: 8 }
  validates :deposit, numericality: { only_integer: true }, length: { maximum: 6 }
  validates :gratuityfee, numericality: { only_integer: true }, length: { maximum: 6 }
  validates :area, numericality: { only_integer: true }, length: { maximum: 2 }
  validates :age, numericality: { only_integer: true }, length: { maximum: 2 }
  validates :layout, presence: true, length: { maximum: 5 }
  validates :lightning, presence: true, length: { maximum: 10 }
  validates :service, presence: true, length: { maximum: 255 }
  validates :hashtag, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  
  #has_many :favorites
  #has_many :users, through: :favorites
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :vendor
 
  mount_uploader :image, ImageUploader
  
end
