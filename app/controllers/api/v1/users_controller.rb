module Api
  module V1
    class UsersController < ApplicationController
      def index
        users = User.all
        render :json => users
      end
      
      def new
        user = User.create
        render :json => user
      end
    
      def show
        user = User.find(params[:id])
        render :json => user
      end

      def station 
        user = User.find(params[:id])
        station = user.stations.first
        render :json => station
      end

      def get_stations
        user = User.find(params[:id])
        stations = user.stations.all
        render :json => stations
      end

      def get_shops
        shop_user_status = []
        shops = []
        station = Station.find(params[:station_id])
        station.shop_stations.each do |shop_station|
          shop = shop_station.shop
          shop_user = ShopUser.find_by(user_id: params[:user_id], shop_id: shop.id)
          shops.push(shop)
          shop_user_status.push(shop_user)
        end
        render :json => {
          shop: shops, shop_user_status: shop_user_status
        }
      end

    end
  end
end
