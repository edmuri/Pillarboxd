class DevelopersController < ApplicationController
  def index
    # Fetch developers and get basic stats: number of games and average rating
    @developers = Developer.left_joins(games: :reviews)
      .select("developers.*, 
               COUNT(DISTINCT games.game_id) as games_count, 
               AVG(reviews.rating) as avg_rating")
      .group("developers.developer_id")
      .order("games_count DESC")
  end

  def show
    @developer = Developer.find(params[:id])
    
    # All games by this developer, ordered by release date descending
    @games = @developer.games.order(release_date: :desc)

    # Total number of games by this developer
    @games_count = @games.count

    # Average rating across all games by this developer
    @avg_rating = Review.joins(:game)
                        .where(games: { game_id: @games.select(:game_id) })
                        .average(:rating)

    # Highest rated games by this developer (top 6)
    @top_games = @games.left_joins(:reviews)
                       .group(:game_id)
                       .order(Arel.sql("COALESCE(AVG(reviews.rating), 0) DESC"))
                       .limit(6)
  end
end
