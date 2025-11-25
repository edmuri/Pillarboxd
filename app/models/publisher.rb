class Publisher < ApplicationRecord
  self.primary_key = "publisher_id"

  has_many :game_publishers
  has_many :games, through: :game_publishers
end
