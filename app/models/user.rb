class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  
  has_many :favorites
  #has_many :houses, through: :favorites
  has_many :favorites, dependent: :destroy
  has_many :favorite_houses, through: :favorites, source: :house
end
