class Onsen < ApplicationRecord
  belongs_to :article
  validates :name, presence: true, length: { maximum: 60 }
  validates :prefectures, presence: true, length: { maximum: 10 }
  validates :quality, presence: true, length: { maximum: 20 }
  validates :infomation, length: { maximum: 2000 }
end
