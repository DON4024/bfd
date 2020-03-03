class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures
  has_many :comments
  has_many :favorites, dependent: :destroy #この行を追記することで関連付くイベントが削除されるとclipも削除されます。
  has_many :fav_pictures, through: :favorites, source: :picture
  # fav_picturesは実在しないが、picturesは既に存在していてエラーになるので作成
  
  validates :nickname, presence: true
  mount_uploader :image, ImageUploader

  # いいね機能で作ってみたが使わなかった
  # def like(picture)
  #   favorites.find_or_create_by(picture_id: picture.id)
  # end

  # def unlike(picture)
  #   favorite = favorites.find_by(picture_id: picture.id)
  #   favorite.destroy if favorite
  # end

  def already_liked?(picture)
    self.favorites.exists?(picture_id: picture.id)
  end
end
