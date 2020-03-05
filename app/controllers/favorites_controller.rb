class FavoritesController < ApplicationController
    

    def create
      user_id = current_user.id
      picture_id = Picture.find(params[:picture_id]).id
      judg = params[:judg_id]
      @temporary = current_user.judgment_new(judg: judg, user_id: user_id, picture_id: picture_id)
      @temporary.save

      redirect_to root_path
    end
  
    def destroy
      user_id = current_user.id
      picture_id = Picture.find(params[:id]).id
      judg = params[:judg_id]
      @temporary = current_user.judgment_destroy(judg: judg, user_id: user_id, picture_id: picture_id)
      @temporary.destroy

      redirect_to root_path




      
      
    end


    
end
