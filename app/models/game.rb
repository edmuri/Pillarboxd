class Game < ApplicationRecord
  # Tell ruby on rails that the primary key is game_id instead of id
  self.primary_key = 'game_id'

  # Associations
  has_many :reviews, foreign_key: "game_id"
end