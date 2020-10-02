

module Api
  module V1
    class TestController < ApplicationController
      def index
        require 'json'
        require 'net/http'
        require "open-uri"
        require "uri"
        # path = "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{ENV["API_KEY"]}&latitude=34.7032039&longitude=135.4976707&category_s=RSFST08009,RSFST08008&coordinates_mode=2&hit_per_page=100&category_l=RSFST08000&sort=2"
        # url = URI.encode path
        # result = open(url)
        # json = JSON.load(result)
        # array = []
        # json["rest"].each do |shop| 
        #   if shop["code"]["category_name_l"].include?("ラーメン・麺料理") 
        #     array.push({
        #       id: shop["id"],
        #       name: shop["name"],
        #       category: shop["category"],
        #       latitude: shop["latitude"],
        #       longitude: shop["longitude"],
        #       image_url: shop["image_url"],
        #       address: shop["address"],
        #     })
        #   end
        # end
        # shop = json["rest"][0]
        shop = Shop.first
        station = Station.first
        user = User.first
        ShopUser.create({
          shop_id: shop.shop_id,
          user_id: user.id
        })

        StationUser.create({
          station_id: station.id,
          user_id: user.id
        })

        render :json => {
          shop: shop, station: station, user: user, 
          shop_station: ShopStation.all, 
          station_user: StationUser.all,
          shop_user: ShopUser.all 
        }

      end
    end
  end
end
