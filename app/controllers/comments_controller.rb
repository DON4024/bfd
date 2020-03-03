class CommentsController < ApplicationController

  def create
    Comment.create(comment_params)
    redirect_to root_path
  end


  private

  def comment_params
    params.require(:comment).permit(:comments).merge(user_id: current_user.id, picture_id: params[:picture_id])

  end
end
