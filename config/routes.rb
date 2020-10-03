Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace 'api' do
    namespace 'v1' do
      get "users/new" => "users#new"
      get "users/get_stations/:id" => "users#get_stations"

      get "stations/get_shops/:id" => "stations#get_shops"
      get "test/create_data" => "test#create_data"
      get "test/edit" => "test#edit"
      post "shop_users/finish/:user_id/:shop_id" => "shop_users#finish"
      post "station_users/register/:user_id/:station_id" => "station_users#register"
      
      resources :users, only:[:index, :show]
      resources :shops, only:[:index, :show]
      resources :stations, only:[:index, :show]
      resources :test
    end
  end
end
