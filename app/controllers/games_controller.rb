class GamesController < ApplicationController
  def index
    @all_games = Game.all

    # apply filter if it exists
    if params[:query].present?
      @games = @all_games.where("title LIKE ?", "%#{params[:query]}%")
    end

    # order games: those without cover first, then alphabetically by title
    @games = @all_games.order(
      Arel.sql("CASE WHEN cover_url = 'NO COVER' THEN 1 ELSE 0 END"), 
      :title
    )

    @games = @games.page(params[:page])
                   .per(50)

  end

  def show
    # Find the game and eager load associations to prevent N+1 queries
    @game = Game.includes(:developers, :publishers, :genres, :platforms).find(params[:id])
  end
end
