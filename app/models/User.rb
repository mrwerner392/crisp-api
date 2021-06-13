class User < ApplicationRecord
  has_many :reviews
  has_many :reviewed_restaurants, through: :reviews, class_name: :restaurants
  has_many :ratings, through: :reviews
  has_many :images, through: :reviews
  has_many :favorites
  has_many :favorite_restaurants, through: :favorites, class_name: :restaurants

end