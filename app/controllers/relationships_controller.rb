class RelationshipsController < ApplicationController

  before_action :set_user

  def create
    user = User.find(params[:follow_id])
    following = current_user.follow(user)
    if following.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  def destroy
    user = User.find(params[:follow_id])
    following = current_user.unfollow(user)
    if following.destroy
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def set_user
    user = User.find(params[:follow_id])
  end


end