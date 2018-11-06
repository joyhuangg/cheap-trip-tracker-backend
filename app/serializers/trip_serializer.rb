class TripSerializer < ActiveModel::Serializer
  has_many :flights
  has_many :activities
  has_many :restaurants, through: :trip_restaurants
  has_many :hotels, through: :trip_hotels
  attributes :id, :name, :user, :location, :start_date, :end_date, :num_ppl, :price, :longitude, :latitude
end
