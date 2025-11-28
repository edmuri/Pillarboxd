class LogsController < ApplicationController
    def index

        @all_logged = Game.left_joins(:logs)
                    .select("games.title, games.cover_url, games.game_id, logs.log_id, logs.play_date")
                    .where("user_id = ?", current_user.id)

        if params[:query].present?
            @logged = @all_logged.where("title LIKE ?", "%#{params[:query]}%")
        else    
            @logged = @all_logged
        end

        @logged = @logged.order(
        Arel.sql("CASE WHEN cover_url = 'NO COVER' THEN 1 ELSE 0 END"), 
        play_date: :desc
        )

        @logged = @logged.page(params[:page])
                   .per(50)

    end
    def show
        @game = Game.includes(:developers, :publishers, :genres, :platforms).find(params[:id])
    end
end