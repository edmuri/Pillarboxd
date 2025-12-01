class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.includes(:logs, :lists).find(params[:id])
    @recent_logs = @user.logs.includes(:game).order(play_date: :desc).limit(5)
    @lists = @user.lists.includes(:games).order(created_at: :desc)
  end
end
