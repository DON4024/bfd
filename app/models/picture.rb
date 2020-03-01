class Picture < ApplicationRecord
  belogs_to :user



  validates :image, presence: true
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
