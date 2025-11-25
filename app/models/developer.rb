class Developer < ApplicationRecord
  self.primary_key = "developer_id"

  has_many :game_developers
  has_many :games, through: :game_developers
end
