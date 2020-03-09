class FavoritesController < ApplicationController
    

    def create
      user_id = current_user.id
      @picture = Picture.find(params[:picture_id])
      picture_id =@picture.id
      judg = params[:judg_id]
      @favorite = current_user.judgment_new(judg: judg, user_id: user_id, picture_id: picture_id)
    
      if @favorite.save
        respond_to do |format|
          format.json
        end
      else
        
      end

      
    end
  
    def destroy
      user_id = current_user.id
      @picture = Picture.find(params[:id])
      picture_id =@picture.id
      judg = params[:judg_id]
      @unfavorite = current_user.judgment_destroy(judg: judg, user_id: user_id, picture_id: picture_id)

      if @unfavorite.destroy
        respond_to do |format|
          format.json
        end
      else
        
      end
    
      
      
    
      
    
    
    
    
    
    
    
    
    
    
    
    
    end
end
