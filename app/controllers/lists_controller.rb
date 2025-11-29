class ListsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    # Pagination params
    @page = params[:page].to_i
    @page = 1 if @page <= 0
    per_page = 20
    offset = (@page - 1) * per_page

    @lists = current_user.lists.order(created_at: :desc)
    @lists = @lists.where("title LIKE ?", "%#{params[:query]}%") if params[:query].present?

    @total_count = @lists.count
    @total_pages = (@total_count.to_f / per_page).ceil
    @more_exists = @page < @total_pages
    @lists = @lists.limit(per_page).offset(offset)
  end

  def show
    @list_items = @list.list_items.includes(:game)
  end

  def new
    @list = current_user.lists.build
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      redirect_to @list, notice: "List created successfully."
    else
      render :new
    end
  end

  def edit; end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "List updated successfully."
    else
      render :edit
    end
  end

  def destroy
    @list.destroy
    redirect_to lists_path, notice: "List deleted successfully."
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title, :description, :is_public, :is_backlog)
  end
end
