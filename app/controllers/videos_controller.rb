class VideosController < ApplicationController
  def index
    @videos = Video.includes(:user)
    @video = Video.new
  end
  
  def create
    @video = Video.new(video_params)
    @video.save 
    redirect_to root_path
  end




private
  def video_params
    params.require(:video).permit(:url, :content).merge(user_id: current_user.id)
  end
end
