class ListItemsController < ApplicationController
  before_action :set_list

  def create
    @list_item = @list.list_items.build(list_item_params)

    if @list_item.save
      redirect_to @list, notice: "Game added to list."
    else
      redirect_to @list, alert: "Could not add game."
    end
  end

  def destroy
    @list_item = @list.list_items.find(params[:id])
    @list_item.destroy
    redirect_to @list, notice: "Game removed from list."
  end

  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def list_item_params
    params.require(:list_item).permit(:game_id)
  end
end
