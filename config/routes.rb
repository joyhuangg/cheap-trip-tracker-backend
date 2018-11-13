Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post '/login', to: 'auth#create'
      get '/current_user', to: "auth#show"
      get '/yelp_restaurants', to: 'restaurants#yelp_restaurants'
      resources :users, only: [:index, :update, :create]
      resources :trips
      delete '/trip_hotels', to: 'trip_hotels#destroy'
      delete '/trip_restaurants', to: 'trip_restaurants#destroy'
      resources :trip_hotels
      resources :trip_restaurants
      resources :flights
      resources :activities, only: [:index, :update, :create, :delete, :show]
      resources :hotels, only: [:index, :update, :create, :delete, :show]
      resources :restaurants, only: [:index, :update, :create, :delete, :show]
      get '/profile', to: 'users#profile'
    end
  end
end
