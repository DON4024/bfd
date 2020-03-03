class Picture < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :favorites
  has_many :users, through: :favorites



  # validates :image, presence: true
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader
end
