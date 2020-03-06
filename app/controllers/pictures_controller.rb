class PicturesController < ApplicationController
  
  def index
    judge = params[:judge]
    judge = 0 if params[:judge].nil?
    @pictures = Picture.create_all_ranks(judge)
    @post = Picture.new
    @comment = Comment.new
    
    if user_signed_in?
      @favorites = Favorite.where(user_id: current_user.id)
      @following = Relationship.where(user_id: current_user.id)
    end
    @coolest = Picture.MostPopularPic(0)
    @cutest = Picture.MostPopularPic(1)
    @creepiest = Picture.MostPopularPic(2)
    
  end

  def new
    @picture = Picture.new
    @favorites = Favorite.all
    @following = Relationship.where(user_id: current_user.id)
  end


  def create
    Picture.create(picture_params)
    redirect_to controller: 'pictures', action: 'index'
  end

 
  

  private
  def picture_params
    params.require(:picture).permit(:image, :content).merge(user_id: current_user.id)
  end

end
