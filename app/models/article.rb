class Article < ApplicationRecord
  has_one_attached :picture, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  has_many :comments, dependent: :destroy
  has_many :labellings, dependent: :destroy
  has_many :labels, through: :labellings
  has_one :onsen, dependent: :destroy, inverse_of: :article
  accepts_nested_attributes_for :onsen, allow_destroy: true

  validates :title, presence: true, length: { maximum: 60 }
  validates :content, presence: true, length: { maximum: 10000 }

end
