Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get "users/new" => "users#new"
      get "users/get_station/:id" => "users#get_station"
      get "users/get_stations/:id" => "users#get_stations"
      get "users/get_shops/:station_id/:user_id" => "users#get_shops"

      get "stations/get_all" => "stations#get_all"

      get "test/create_data" => "test#create_data"
      get "test/edit" => "test#edit"

      post "shop_users/finish/:user_id/:shop_id" => "shop_users#finish"
      post "station_users/register/:user_id/:station_id" => "station_users#register"
      get  "station_users/register/:user_id/:station_id" => "station_users#register"
      
      resources :users, only: [:index, :show]
      resources :shops, only: [:index, :show]
      resources :stations, only: [:index, :show]
      resources :test
      resources :setup, only: [:index]
      resources :station_users, only: [:index]
    end
  end
end
