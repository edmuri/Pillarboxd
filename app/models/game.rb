class Game < ApplicationRecord
  # Tell ruby on rails that the primary key is game_id instead of id
  self.primary_key = "game_id"

  # Associations
  has_many :game_developers
  has_many :developers, through: :game_developers

  has_many :game_publishers
  has_many :publishers, through: :game_publishers
  
  has_many :game_genres
  has_many :genres, through: :game_genres
  
  has_many :game_platforms
  has_many :platforms, through: :game_platforms
  
  has_many :reviews
  has_many :logs

  has_many :list_entries
  has_many :lists, through: :list_entries
end