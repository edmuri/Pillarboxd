class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
   @user = User.includes(:logs, :lists).find(params[:id])
   @lists = @user.lists.order(list_id: :desc)
   @recent_logs = @user.logs.order(play_date: :desc).limit(10)
  end
end
