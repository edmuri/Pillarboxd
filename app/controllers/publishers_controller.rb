class PublishersController < ApplicationController
  def index
    # Fetch publishers and get basic stats: number of games and average rating
    @publishers = Publisher.left_joins(games: :reviews)
      .select("publishers.*, 
               COUNT(DISTINCT games.game_id) as games_count, 
               AVG(reviews.rating) as avg_rating")
      .group("publishers.publisher_id")
      .order("games_count DESC")
  end

  def show
    @publisher = Publisher.find(params[:id])
    
    # Get all games
    @games = @publisher.games.order(release_date: :desc)
    @games_count = @games.count

    # Stats
    @avg_rating = Review.joins(:game)
                        .where(games: { game_id: @games.select(:game_id) })
                        .average(:rating)

    # Top 6 for the grid
    @top_games = @games.left_joins(:reviews)
                       .group(:game_id)
                       .order(Arel.sql("COALESCE(AVG(reviews.rating), 0) DESC"))
                       .limit(6)
  end
end
