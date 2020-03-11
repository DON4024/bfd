class PicturesController < ApplicationController
  
  def index
    judge = params[:judge]
    judge = "0" if params[:judge].nil?
    @pictures = Picture.create_all_ranks(judge)
    
    @post = Picture.new
    @comment = Comment.new
    @coolest = Picture.MostPopularPic(0)
    @cutest = Picture.MostPopularPic(1)
    @creepiest = Picture.MostPopularPic(2)
    if user_signed_in?
      @favorites = Favorite.where(user_id: current_user.id)
      @following = Relationship.where(user_id: current_user.id)
    end
    respond_to do |format|
      format.html
      format.json
    end 
  end

  def new
    @picture = Picture.new
    @favorites = Favorite.all
    @following = Relationship.where(user_id: current_user.id)
  end


  def create
    @picture =Picture.new(picture_params)
    if  @picture.save then
      respond_to do |format|
        format.json
      end
    else
      flash.now[:alert] = 'メッセージを入力してください。'
      redirect_to controller: 'pictures', action: 'index'
    end
  end

 
  

  private
  def picture_params
    params.require(:picture).permit(:image, :content).merge(user_id: current_user.id)
  end

end
