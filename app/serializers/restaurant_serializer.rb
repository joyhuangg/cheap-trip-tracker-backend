class RestaurantSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :yelp_id, :cuisines, :name, :url, :rating, :longitude, :latitude, :address, :price

end
