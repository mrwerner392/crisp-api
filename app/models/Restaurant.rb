class Restaurant < ApplicationRecord
  has_many :reviews
  has_many :ratings, through: :reviews
  has_many :images, through: :reviews
  has_many :users_who_reviewed, through: :reviews, class_name: :users
  has_many :favorites
  has_many :users_who_favorited, through: :reviews, class_name: :users

end