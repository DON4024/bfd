class Picture < ApplicationRecord
  belongs_to :user

  has_many :comments
  # ↓お気に入り機能
  has_many :favorites
  has_many :users, through: :favorites
  # ↓評価機能 cool
  has_many :cool
  has_many :users, through: :favorites
  # ↓評価機能 cute
  has_many :cute
  has_many :users, through: :favorites
  # ↓評価機能 creepy
  has_many :cteepy
  has_many :users, through: :favorites

  


  # validates :image, presence: true
  validates :content, presence: true, unless: :image?
  mount_uploader :image, ImageUploader



  

end
