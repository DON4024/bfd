class PicturesController < ApplicationController
  
  def index
    @pictures = Picture.includes(:user)
    @comment = Comment.new
    @favorites = Favorite.all
    
    
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
