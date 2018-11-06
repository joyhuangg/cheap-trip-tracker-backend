class Hotel < ApplicationRecord
  has_many :trip_hotels
  has_many :trips, through: :trip_hotels
end
