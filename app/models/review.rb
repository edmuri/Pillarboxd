class Review < ApplicationRecord
  self.primary_key = "review_id"
  self.record_timestamps = false

  belongs_to :user
  belongs_to :game

  validates :rating, presence: true, inclusion: { in: 1..5 }
  validates :review_text, length: { maximum: 2000 } # Optional limit
  
  # The "One Review Per Game" Rule:
  validates :user_id, uniqueness: { scope: :game_id, message: "You have already reviewed this game" }
end
