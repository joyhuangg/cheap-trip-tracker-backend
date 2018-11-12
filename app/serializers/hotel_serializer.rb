class HotelSerializer < ActiveModel::Serializer
  attributes :id, :longitude, :latitude, :address, :price, :rating, :image_url, :property_name
end
