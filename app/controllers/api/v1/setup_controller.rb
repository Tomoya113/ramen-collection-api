require 'json'
require 'net/http'
require "open-uri"
require "uri"

module Api
  module V1
    class SetupController < ApplicationController
      def index

        stations = [
          {name: '地下鉄梅田駅', latitude: "34.7031923", longitude: "135.4967068" },
          {name: '北新地駅', latitude: "34.6994459", longitude: "135.4944568" },
          {name: '福島駅', latitude: "34.6964287", longitude: "135.4866259" }
        ]
        stations.each do |station|
          new_station = Station.create({
            name: station[:name],
            latitude: station[:latitude],
            longitude: station[:longitude]
          })
          path = "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{ENV["API_KEY"]}&latitude=#{new_station["latitude"]}&longitude=#{new_station["longitude"]}&category_s=RSFST08009,RSFST08008&coordinates_mode=2&hit_per_page=100&category_l=RSFST08000&sort=2"
          url = URI.encode path
          result = open(url)
          json = JSON.load(result)
          json["rest"].each do |shop| 
            if shop["code"]["category_name_l"].include?("ラーメン・麺料理") 
              new = Shop.create({
                shop_id: shop["id"],
                name: shop["name"],
                category: shop["category"],
                latitude: shop["latitude"],
                longitude: shop["longitude"],
                image_url: shop["image_url"]["shop_image1"] + "," + shop["image_url"]["shop_image2"],
                address: shop["address"],
              })
              ShopStation.create({
                station_id: new_station.id,
                shop_id: new.shop_id
              })
            end
          end
        end
        render :json => Shop.all

      end
    end
  end
end