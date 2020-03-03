class FavoritesController < ApplicationController
  
    def create
      @user_id = current_user.id
      @picture_id = Picture.find(params[:picture_id]).id
      @favorite = Favorite.new(picture_id: @picture_id, user_id: @user_id)
      # @favoriteconfirm = Favorite.all
    #     if @favoriteconfirm.blank?
    #       @favorite.save
    #     elsif @favoriteconfirm.picture_id != @picture_id && @favoriteconfirm.user_id != current_user.id
    #       binding.pry
    #       @favorite.save
    #     end
    #     redirect_to  root_path
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
