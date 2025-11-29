class LogGameController < ApplicationController
    def new
        @log_game = Log.new
    end

    def create
        @log_game = Log.new
        game_name = params[:log][:game]
        date_played = params[:log][:play_date]
        completed = params[:log][:is_completed]

        @errors = []

        @errors << "Cannot log blank game" if game_name.blank?
        @errors << "Cannot log blank play date" if date_played.blank?

        game = Game.where("title LIKE ?", "%#{game_name}%").first
        
        if game.nil?
            @errors << "Game not found in database" if game.nil? && game_name.present?
        end

        if @errors.any?
            @errors.each do |err|
                @log_game.errors.add(:base, err)
            end
            render :new, status: :unprocessable_entity, formats: [:html]
            return
        end

        @log_game = game.logs.build(
            user_id: current_user.id,
            play_date: date_played,
            is_completed: completed
        )

        respond_to do |format|
            if @log_game.save
                format.turbo_stream { render turbo_stream: turbo_stream.remove("modal") }
                format.html { redirect_to logs_path }
            else
                render :new, status: :unprocessable_entity, formats: [:html]
            end
        end
    end
end