class Label < ApplicationRecord
  has_many :labellings, dependent: :destroy
  has_many :articles, through: :labellings
end
