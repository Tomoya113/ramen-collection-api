require 'json'
require 'net/http'
require "open-uri"
require "uri"

module Api
  module V1
    class TestController < ApplicationController
      def index
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
        render :json => json
      end

      def create_data
        path = "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{ENV["API_KEY"]}&latitude=34.7032039&longitude=135.4976707&category_s=RSFST08009,RSFST08008&coordinates_mode=2&hit_per_page=100&category_l=RSFST08000&sort=2"
        url = URI.encode path
        result = open(url)
        json = JSON.load(result)
        array = []
        station = Station.first
        
        # json["rest"].each do |shop| 
        #   if shop["code"]["category_name_l"].include?("ラーメン・麺料理") 
        #     new = Shop.create({
        #       shop_id: shop["id"],
        #       name: shop["name"],
        #       category: shop["category"],
        #       latitude: shop["latitude"],
        #       longitude: shop["longitude"],
        #       image_url: shop["image_url"]["shop_image1"] + "," + shop["image_url"]["shop_image2"],
        #       address: shop["address"],
        #     })
        #     ShopStation.create({
        #       station_id: station.id,
        #       shop_id: new.shop_id
        #     })
        #   end
        # end
        # render :json => { 
        #   shop: {count: Shop.count, shops: Shop.all},
        #   station: {count: Station.count, stations: Station.all},
        #   shop_stations: {count: ShopStation.count, shop_stations: ShopStation.all}
        # }
        user = User.first
        shops = user.stations[0].shops
        shops.each do |shop|
          ShopUser.create({
            user_id: user.id,
            shop_id: shop.shop_id
          })
        end
        render :json => ShopUser.all
      end
    end
  end
end
