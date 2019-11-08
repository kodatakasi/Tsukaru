class Article < ApplicationRecord
  mount_uploader :image, ImageUploader
  has_one_attached :picture
end
