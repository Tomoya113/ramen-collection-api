module Api
  module V1
    class StationUsersController < ApplicationController
      def index 
        render :json => StationUser.all
      end
      def register
        StationUser.create({
          user_id: params[:user_id],
          station_id: params[:station_id]
        })
    
        render :json => {status: 'success'}
      end
    end
    
  end
end
