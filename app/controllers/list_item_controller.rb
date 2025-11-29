class ListItemsController < ApplicationController
  before_action :set_list

  def create
    @list_item = @list.list_items.find_or_initialize_by(game_id: list_item_params[:game_id])

    if @list_item.persisted?
      redirect_to @list, notice: "Game is already in the list."
    elsif @list_item.save
      redirect_to @list, notice: "Game added to list."
    else
      redirect_to @list, alert: "Could not add game."
    end
  end

  def destroy
    @list_item = @list.list_items.find(params[:id])
    if @list_item&.destroy
      redirect_to @list, notice: "Game removed from list."
    else
      redirect_to @list, notice: "Game could not be removed."
    end
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_item_params
    params.require(:list_item).permit(:game_id)
  end
end
