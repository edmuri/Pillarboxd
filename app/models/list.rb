class List < ApplicationRecord
  belongs_to :user
  has_many :list_entries, class_name: "ListEntry", dependent: :destroy
  has_many :games, through: :list_entries

  validates :title, presence: true
end
