class Tag < ApplicationRecord
  has_many :liked_tags
  has_many :disliked_tags
  has_many :users, through: :liked_tags
  has_many :users, through: :disliked_tags
end
