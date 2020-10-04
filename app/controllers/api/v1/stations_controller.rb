

module Api
  module V1
    class StationsController < ApplicationController
      def get_all
        render :json => Station.all
      end
      
      def get_shops
        station = Station.find(params[:id])
        shops = station.shops.all
        render :json => shops
      end
    end
  end
end