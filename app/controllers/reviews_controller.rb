class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_game

  def new
    # Check if user already reviewed this game
    existing_review = Review.find_by(user: current_user, game: @game)
    
    if existing_review
      # If strict requirement: Redirect them or show an error
      redirect_to game_path(@game), alert: "You have already reviewed this game."
    else
      @review = @game.reviews.build
    end
  end

  def create
    @review = @game.reviews.build(review_params)
    @review.user = current_user
    @review.review_date = Date.today

    if @review.save
      # Success: Refresh the page to show the new review
      redirect_to game_path(@game), notice: "Review published!"
    else
      # Failure: Reload the modal form with errors
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_game
    @game = Game.find(params[:game_id])
  end

  def review_params
    params.require(:review).permit(:rating, :review_text)
  end
end
