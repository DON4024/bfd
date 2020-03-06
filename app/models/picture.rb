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



  def self.create_all_ranks(judge = 0) #Pictureクラスからデータを取ってくる処理なのでクラスメソッド！
    
    if judge == 0
      Picture.includes(:user).order('created_at desc')
    elsif judge == "1"
      Picture.find(Cool.group(:picture_id).order('count(picture_id) desc').pluck(:picture_id))
    elsif judge == "2"
      Picture.find(Cute.group(:picture_id).order('count(picture_id) desc').pluck(:picture_id))
    elsif judge == "3"
      Picture.find(Creepy.group(:picture_id).order('count(picture_id) desc').pluck(:picture_id))
    end
  end

  def self.MostPopularPic(judge) #Pictureクラスからデータを取ってくる処理なのでクラスメソッド！
    if judge == 0
      Picture.find_by(id: Cool.group(:picture_id).order('count(picture_id) desc').limit(1).pluck(:picture_id))
    elsif judge == 1
      Picture.find_by(id: Cute.group(:picture_id).order('count(picture_id) desc').limit(1).pluck(:picture_id))
    elsif judge == 2
      Picture.find_by(id: Creepy.group(:picture_id).order('count(picture_id) desc').limit(1).pluck(:picture_id))
    end
  end

end
