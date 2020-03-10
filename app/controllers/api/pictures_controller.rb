class Api::PicturesController < ApplicationController

  def index
    picture = Picture.all
    last_message_id = params[:id].to_i
    @pictures = picture.includes(:user).where("id > ?", last_message_id)
  end

end