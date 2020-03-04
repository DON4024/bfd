class FavoritesController < ApplicationController
  
    def create
      @user_id = current_user.id
      @picture_id = Picture.find(params[:picture_id]).id
      @favorite = Favorite.new(picture_id: @picture_id, user_id: @user_id)

      @favorite.save
      redirect_to root_path
    end
  
    def destroy
      @favorite = Favorite.find_by(picture_id: params[:id])
      if @favorite.destroy
        redirect_to root_path
      end
    end
end
