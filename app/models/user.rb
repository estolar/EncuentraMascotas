class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :petlost
  has_many :petfound
  has_one_attached :photo
  has_many :reviews, dependent: :destroy
end
