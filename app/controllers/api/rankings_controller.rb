class Api::RankingsController < ApplicationController

  def index
    @coolest = Picture.MostPopularPic(0)
    @cutest = Picture.MostPopularPic(1)
    @creepiest = Picture.MostPopularPic(2)
  end

end


   