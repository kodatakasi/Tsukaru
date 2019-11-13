class Article < ApplicationRecord
  has_one_attached :picture, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  belongs_to :user
end
