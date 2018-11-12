require 'rest-client'
require 'json'
require 'pry'

class Restaurant < ApplicationRecord
  has_many :trip_restaurants
  has_many :trips, through: :trip_restaurants

  def self.fetch_restaurants(lon, lat)
    yelp_key = ENV['YELP_API_KEY']
    url = "https://api.yelp.com/v3/businesses/search?term=food&price=1&latitude=#{lat}&longitude=#{lon}&limit=50&sort=real_distance&order=asc";

    response_string = RestClient.get(url, headers={"Authorization": "Bearer #{yelp_key}"})
    response_hash = JSON.parse(response_string)

  end
end
