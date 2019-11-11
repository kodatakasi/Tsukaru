class Article < ApplicationRecord
  has_one_attached :picture
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  belongs_to :user
end
