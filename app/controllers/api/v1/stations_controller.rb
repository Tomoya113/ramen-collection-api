

module Api
  module V1
    class StationsController < ApplicationController
      def get_all
        render :json => Station.all
      end
      
    end
  end
end