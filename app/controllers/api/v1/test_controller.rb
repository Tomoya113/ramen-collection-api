

module Api
  module V1
    class TestController < ApplicationController
      def index
        require 'json'
        require 'net/http'
        require "open-uri"
        require "uri"
        path = "https://api.gnavi.co.jp/RestSearchAPI/v3/?keyid=#{ENV["API_KEY"]}&latitude=34.7032039&longitude=135.4976707&category_s=RSFST08009,RSFST08008&coordinates_mode=1&hit_per_page=100&category_l=RSFST08000&sort=2"
        url = URI.encode path
        result = open(url)
        json = JSON.load(result)
        array = []
        json["rest"].each do |shop| 
          if shop["code"]["category_name_l"].include?("ラーメン・麺料理") 
            array.push({
              id: shop["id"],
              name: shop["name"],
              category: shop["category"],
              latitude: shop["latitude"],
              longitude: shop["longitude"],
              image_url: shop["image_url"],
              address: shop["address"],
            })
          end
        end
        p array.length
        render :json => array

      end
    end
  end
end
