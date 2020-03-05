class FavoritesController < ApplicationController
    

    def create
      user_id = current_user.id
      picture_id = Picture.find(params[:picture_id]).id
      judg = params[:judg_id]
      
      @temporary = current_user.judgment(judg: judg, user_id: user_id, picture_id: picture_id)
      # @temporary = Cute.new(picture_id: @picture_id, user_id: @user_id)
      @temporary.save

      redirect_to root_path
    end
  
    def destroy
      @temporary = Favorite.find_by(picture_id: params[:id])
      case(judg)
        when 1
          @cool = @temporary
          @cool.destroy
        when 2
          @cute = @temporary
          @cute.destroy
        when 3
          @creepy = @temporary
          @creepy.destroy
        when 4
          @favorite = @temporary
          @favorite.destroy
      end
      
        redirect_to root_path
      
    end


    
end
