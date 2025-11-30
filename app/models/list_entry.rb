class ListEntry < ApplicationRecord
  self.table_name = "list_entries"

  belongs_to :list
  belongs_to :game
end
