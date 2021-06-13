class Image < ApplicationRecord
  belongs_to :review
  belongs_to :restaurant

end