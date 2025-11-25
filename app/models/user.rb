class User < ApplicationRecord
  self.primary_key = "user_id"
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
