class GamesController < ApplicationController
  def index
    @games = Game.all

    # apply filter if it exists
    if params[:query].present?
      @games = @games.where("title LIKE ?", "%#{params[:query]}%")
    end

    # order games: those without cover first, then alphabetically by title
    @games = @games.order(
      Arel.sql("CASE WHEN cover_url = 'NO COVER' THEN 1 ELSE 0 END"), 
      :title
    )
  end

  def show
    @game = Game.find(params[:game_id])
  end
end
