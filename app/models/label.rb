class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :articles, through: :labellings

  validates :name, presence: true
end
