class PicturesController < ApplicationController
  
  def index
    @pictures = Picture.includes(:user)
    @comment = Comment.new
    if user_signed_in?
      @favorites = Favorite.where(user_id: current_user.id)
      @following = Relationship.where(user_id: current_user.id)
      
    end
    pic_id = Cool.group(:picture_id).order('count(picture_id) desc').limit(1).pluck(:picture_id)
    @coolest = Picture.find_by(id: pic_id)
    pic_id = Cute.group(:picture_id).order('count(picture_id) desc').limit(1).pluck(:picture_id)
    @cutest = Picture.find_by(id: pic_id)
    pic_id = Creepy.group(:picture_id).order('count(picture_id) desc').limit(1).pluck(:picture_id)
    @creepiest = Picture.find_by(id: pic_id)
    
  end

  def new
    @picture = Picture.new
    @favorites = Favorite.all
  end


  def create
    Picture.create(picture_params)
    redirect_to root_path
  end

 
  

  private
  def picture_params
    params.require(:picture).permit(:image, :content).merge(user_id: current_user.id)
  end

end
