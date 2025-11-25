class Platform < ApplicationRecord
  self.primary_key = "platform_id"

  has_many :game_platforms
  has_many :games, through: :game_platforms
end
