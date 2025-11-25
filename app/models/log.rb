class Log < ApplicationRecord
  self.primary_key = "log_id"

  belongs_to :user, foreign_key: "user_id"
  belongs_to :game, foreign_key: "game_id"
  
  # Handle the custom foreign key for platform
  belongs_to :platform, foreign_key: "platform_played_id", optional: true
end