class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    # Pagination params
    @page = params[:page].to_i
    @page = 1 if @page <= 0
    per_page = 20
    offset = (@page - 1) * per_page

    base_scope =
      if current_user
        # Show public lists + user’s own private lists
        List.where("is_public = ? OR user_id = ?", true, current_user.id)
      else
        # Visitors only see public lists
        List.where(is_public: true)
      end

    @lists = base_scope.order(created_at: :desc)
    @lists = @lists.where("title LIKE ?", "%#{params[:query]}%") if params[:query].present?
    
    @total_count = @lists.count
    @total_pages = (@total_count.to_f / per_page).ceil
    @more_exists = @page < @total_pages
    @lists = @lists.limit(per_page).offset(offset)
  end

  def show
    @list_entries = @list.list_entries.includes(:game)
    if params[:query].present?
      search_query = "%#{params[:query].downcase}%"
      @list_entries = @list_entries.joins(:game)
                                  .where("LOWER(games.title) LIKE ?", search_query)
    end
  end

  def add_game
    list = List.find(params[:id])
    game = Game.find(params[:game_id])

    if list.games.exists?(game_id: game.game_id)
      redirect_to game_path(game), notice: "Game is already in this list."
      return
    end

    list.games << game
    redirect_to game_path(game), notice: "Game added to #{list.title}."
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to lists_path, notice: "List created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to lists_path, notice: "List updated successfully."
    else
      render :edit
    end
  end

  def destroy
    if @list.destroy
      redirect_to lists_path, notice: "List deleted successfully."
    else
      redirect_to @list, notice: "Failed to delete list."
    end
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description, :is_public, :is_backlog)
  end
end
