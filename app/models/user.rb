class User < ApplicationRecord
  self.primary_key = "user_id"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :logs, dependent: :destroy
  has_many :lists, dependent: :destroy 
  has_one_attached :profile_picture

end
