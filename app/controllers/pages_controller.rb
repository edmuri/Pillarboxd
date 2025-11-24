class PagesController < ApplicationController
  def home
    # Pick a random featured game to display on the home page
    offset = rand(Game.count)
    @featured_game = Game.offset(offset).first
  end
end
