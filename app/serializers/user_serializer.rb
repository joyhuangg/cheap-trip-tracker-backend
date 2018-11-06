class UserSerializer < ActiveModel::Serializer
  has_many :trips
  attributes :id, :name, :email, :current_trip_id, :current_trip

  def current_trip
    object.trips.find{|trip| trip.id == object.current_trip_id}
  end

end
