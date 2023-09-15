class User < ApplicationRecord
  has_many :liked_tags, dependent: :destroy
  has_many :disliked_tags, dependent: :destroy
  has_many :tags, through: :liked_tags
  has_many :tags, through: :disliked_tags
end
