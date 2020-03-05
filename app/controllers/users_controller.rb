class UsersController < ApplicationController

  
  def edit
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
    @favorites = Favorite.where(user_id: current_user.id)
    @following = Relationship.all
    @picture= current_user.pictures
  end


  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :passwordconfirmation)
    
  end

end
