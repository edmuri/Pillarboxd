class Review < ApplicationRecord
  self.primary_key = "review_id"
  
  # Connects back to the Game model
  belongs_to :game, foreign_key: "game_id"
  belongs_to :user, foreign_key: "user_id"
end
