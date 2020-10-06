class Post < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  mount_uploader :image, ImageUploader
end
