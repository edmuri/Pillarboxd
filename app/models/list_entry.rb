class ListEntry < ApplicationRecord
  self.table_name = "list_entries"

  belongs_to :list
  belongs_to :game, foreign_key: "game_id", primary_key: "game_id"
end
