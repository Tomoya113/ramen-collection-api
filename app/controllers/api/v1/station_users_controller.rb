module Api
  module V1
    class StationUsersController < ApplicationController
      def index 
        render :json => StationUser.all
      end
      def register
        station_user = StationUser.create!({
          user_id: params[:user_id],
          station_id: params[:station_id]
        })
        
        station_user = StationUser.find_by(station_id: params[:station_id], user_id: params[:user_id])
        shop_stations = ShopStation.where(station_id: station_user.station_id)
        shop_users = []
        shop_stations.each do |shop_station| 
          shop_user = ShopUser.create!({
            shop_id: shop_station.shop.id,
            user_id: params[:user_id]
          })
          shop_users.push(shop_user)
        end
        
        render :json => {status: 'success', shop_users: shop_users}
      end
    end
    
  end
end
