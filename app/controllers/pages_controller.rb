class PagesController < ApplicationController
  def home
    # Pick a random featured game to display on the home page
    @featured_game = Game.where(title: "Payday 2: Crimewave Edition").first || Game.first

    # Select the top 6 games based on review scores, excluding those without a cover image
    @top_games = Game
      .left_joins(:reviews)
      .where.not(cover_url: "NO COVER")
      .group(:game_id)
      .order(Arel.sql("COALESCE(AVG(reviews.rating), 0) DESC, title ASC"))
      .limit(6)

    # Select the 6 most recently released games with a cover image
    @new_games = Game
      .where.not(cover_url: "NO COVER")
      .where("release_date <= ?", Date.today) 
      .order(release_date: :desc)
      .limit(6)

    # Select the 6 upcoming games with a cover image (ordered by soonest release date)
    @upcoming_games = Game
      .where.not(cover_url: "NO COVER")
      .where("release_date > ?", Date.today)
      .order(release_date: :asc)
      .limit(6)
  end
end
