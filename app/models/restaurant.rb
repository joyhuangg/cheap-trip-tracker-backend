class Restaurant < ApplicationRecord
  has_many :trip_restaurants
  has_many :trips, through: :trip_restaurants
end
