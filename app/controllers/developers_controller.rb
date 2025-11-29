class DevelopersController < ApplicationController
  def index
    @page = params[:page].to_i
    @page = 1 if @page <= 0
    @sort = params[:sort] || 'games_desc'
    
    per_page = 15
    offset = (@page - 1) * per_page

    base_query = Developer.left_joins(games: :reviews)
      .select("developers.*, 
               COUNT(DISTINCT games.game_id) as games_count, 
               AVG(reviews.rating) as avg_rating")
      .group("developers.developer_id")

    base_query = case @sort
                 when 'games_asc'   then base_query.order("games_count ASC")
                 when 'rating_desc' then base_query.order("avg_rating DESC")
                 when 'rating_asc'  then base_query.order("avg_rating ASC")
                 when 'name_asc'    then base_query.order("name ASC")
                 else base_query.order("games_count DESC")
                 end

    @developers = base_query.limit(per_page).offset(offset)
    
    @total_count = Developer.count 
    @total_pages = (@total_count.to_f / per_page).ceil
    @more_exists = @page < @total_pages
  end

  def show
    @developer = Developer.find(params[:id])
    
    @page = params[:page].to_i
    @page = 1 if @page <= 0
    @sort = params[:sort] || 'newest'
    per_page = 15
    offset = (@page - 1) * per_page

    @games_count = @developer.games.count
    @avg_rating = Review.where(game_id: @developer.games.select(:game_id))
                        .average(:rating)

    base_query = @developer.games.left_joins(:reviews).group("games.game_id")

    sorted_query = case @sort
                   when 'rating_desc' 
                     base_query.order(Arel.sql("AVG(reviews.rating) DESC"))
                   when 'name_asc'    
                     base_query.order("games.title ASC")
                   when 'oldest'      
                     base_query.order("games.release_date ASC")
                   else
                     base_query.order("games.release_date DESC")
                   end

    @games = sorted_query.select("games.*, AVG(reviews.rating) as computed_rating")
                         .limit(per_page)
                         .offset(offset)
    
    @top_games = @developer.games.left_joins(:reviews)
                           .group("games.game_id")
                           .order(Arel.sql("COALESCE(AVG(reviews.rating), 0) DESC"))
                           .limit(6)
                           
    @total_pages = (@games_count.to_f / per_page).ceil
    @more_exists = @page < @total_pages
  end
end
