class Genre < ApplicationRecord
  self.primary_key = "genre_id"

  has_many :game_genres
  has_many :games, through: :game_genres
end
