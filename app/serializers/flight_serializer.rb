class FlightSerializer < ActiveModel::Serializer
  attributes :id, :origin, :destination, :departure_date, :return_date, :flight_number, :operating_airline, :price, :trip
end
