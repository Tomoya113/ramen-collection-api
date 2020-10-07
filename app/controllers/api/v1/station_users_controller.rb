module Api
  module V1
    class StationUsersController < ApplicationController
      def index 
        render :json => StationUser.all
      end
      def register
        station_user = StationUser.create({
          user_id: params[:user_id],
          station_id: params[:station_id]
        })
        
        shop_stations = ShopStation.where(station_id: station_user.station_id)
        shop_stations.each do |shop_station| 
          ShopUser.create({
            shop_id: shop_station.shop.id,
            user_id: params[:user_id]
          })
          
        end
        
        render :json => {status: 'success'}
      end
    end
    
  end
end
