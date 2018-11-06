class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :name, :url, :rating, :longitude, :latitude, :address

end
