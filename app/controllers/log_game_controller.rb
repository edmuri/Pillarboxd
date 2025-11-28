class LogGameController < ApplicationController
    def new
        @log_game = Log.new
    end

    def create
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
            respond_to do |format|
                format.turbo_stream { render :new, status: :unprocessable_entity } 
                format.html { render :new, status: :unprocessable_entity }
            end
            return
        end

        @log_game = game.logs.build(
            user_id: current_user.id,
            play_date: date_played,
            is_completed: completed
        )

        if @log_game.save
            respond_to do |format|
            format.turbo_stream {
             render turbo_stream: turbo_stream.remove("modal")
            }
            end
        else
             respond_to do |format|
                format.turbo_stream { render :new, status: :unprocessable_entity } 
                format.html { render :new, status: :unprocessable_entity }
            end
        end
        
    end
end