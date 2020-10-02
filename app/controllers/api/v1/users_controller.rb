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

      def get_stations
        user = User.find(params[:id])
        stations = user.stations.all
        render :json => stations
      end
    end
  end
end
