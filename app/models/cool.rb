class Cool < ApplicationRecord
  belongs_to :user
  belongs_to :picture
  validates_uniqueness_of :picture_id, scope: :user_id


  def find_top
    pic_id = Cool.group(:picture_id).order('count(picture_id) desc').limit(1).picture_id
    coolest = Picture.find_by(picture_id: pic_id)
    binding.pry
  end
end
