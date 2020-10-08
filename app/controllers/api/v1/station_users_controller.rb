module Api
  module V1
    class StationUsersController < ApplicationController
      def index 
        render :json => StationUser.all
      end
      def register
        # station_user = StationUser.create({
        #   user_id: params[:user_id],
        #   station_id: params[:station_id]
        # })
        
        station_user = StationUser.find_by(station_id: params[:station_id], user_id: params[:user_id])
        p 'station_user'
        p station_user
        shop_stations = ShopStation.where(station_id: station_user.station_id)
        p 'shop_stations'
        p shop_stations
        shop_stations.each do |shop_station| 
          hoge = ShopUser.create!({
            shop_id: shop_station.shop.id,
            user_id: params[:user_id]
          })
          p hoge
        end
        
        render :json => {status: 'success'}
      end
    end
    
  end
end
