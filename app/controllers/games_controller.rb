class GamesController < ApplicationController
  def index
    @page = params[:page].to_i
    @page = 1 if @page <= 0
    per_page = 25
    offset = (@page - 1) * per_page

    @all_games = Game.all 
    
    # Start our filtered query
    scope = Game.all

    if params[:query].present?
      scope = scope.where("title LIKE ?", "%#{params[:query]}%")
    end

    scope = scope.order(
      Arel.sql("CASE WHEN cover_url = 'NO COVER' THEN 1 ELSE 0 END"), 
      :title
    )

    @total_count = scope.count
    @total_pages = (@total_count.to_f / per_page).ceil
    @more_exists = @page < @total_pages

    @games = scope.limit(per_page).offset(offset)
  end

  def show
    @game = Game.includes(:developers, :publishers, :genres, :platforms).find(params[:id])
    
    @sort_type = params[:sort] || 'newest'
    
    @page = params[:page].to_i
    @page = 1 if @page <= 0
    per_page = 15
    offset = (@page - 1) * per_page

    base_query = @game.reviews.includes(:user).where.not(review_text: [nil, ""])

    sorted_query = case @sort_type
                   when 'highest' then base_query.order(rating: :desc)
                   when 'lowest'  then base_query.order(rating: :asc)
                   else base_query.order(review_date: :desc)
                   end

    @reviews = sorted_query.offset(offset).limit(per_page)
    
    total_reviews = base_query.count
    @total_pages = (total_reviews.to_f / per_page).ceil
    @more_reviews_exist = @page < @total_pages
  end
end
