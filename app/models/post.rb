class Post < ApplicationRecord
  validates :img, presence: true
  validates :title, presence: true
  validates :text, presence: true
  belongs_to :user, optional: true
  has_many :comments
  mount_uploader :img, ImgUploader
end
