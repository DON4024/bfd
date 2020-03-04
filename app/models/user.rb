class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :pictures
  has_many :comments
  has_many :favorites, dependent: :destroy #この行を追記することで関連付くイベントが削除されるとclipも削除されます。
  has_many :fav_pictures, through: :favorites, source: :picture

  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  # has_many :relationships, foreign_key: 'follow_id' #←あとで消す
  # has_many :followers, through: :relationships, source: :user #←あとで消す
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
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

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)

  end
end
