class Tag < ApplicationRecord
  has_many :liked_tags, dependent: :destroy
  has_many :disliked_tags, dependent: :destroy
  has_many :users, through: :liked_tags
  has_many :users, through: :disliked_tags
end
