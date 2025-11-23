class GamesController < ApplicationController
  def index
    @games = Game.order(
      Arel.sql("CASE WHEN cover_url = 'NO COVER' THEN 1 ELSE 0 END"),
      :title
    )
  end

  def show
    @game = Game.find(params[:game_id])
  end
end
