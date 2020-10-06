class Post < ApplicationRecord
  validates :image, presence: true
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :user
  has_manu :comments
  mount_uploader :image, ImageUploader
end
