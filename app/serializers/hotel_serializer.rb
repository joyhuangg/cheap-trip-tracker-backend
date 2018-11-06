class HotelSerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :address, :price, :property_name
end
