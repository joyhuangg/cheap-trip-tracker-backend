class TripRestaurant < ApplicationRecord
  belongs_to :trip
  belongs_to :restaurant
end
