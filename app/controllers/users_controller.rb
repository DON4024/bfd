class UsersController < ApplicationController

  
  def edit
    @user = User.find(params[:id])
    @favorites = Favorite.all
    @following = Relationship.all
  end

  def update
    if current_user.update(user_params)
      
      redirect_to root_path
    else
      @favorites = Favorite.all
      @following = Relationship.all
      render :edit
    end
  end

  def show
    @user = User.find(params[:id]) 
    @pictuers = @user.pictures
    @following = Relationship.where(user_id: params[:id])
    @favorites = Favorite.where(user_id: params[:id])
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :email, :password, :passwordconfirmation)
  end
end
