class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :cuisines, :name, :url, :rating, :longitude, :latitude, :address, :price

end
