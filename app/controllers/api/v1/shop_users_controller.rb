module Api
  module V1
    class ShopUsersController < ApplicationController
      def index
        render :json => ShopUser.all
      end
      def finish
        shop_user = ShopUser.find_by(shop_id: params[:shop_id], user_id: params[:user_id])
        shop_user.isFinished = !(shop_user.isFinished)
        render :json => shop_user
      end
    end
  end
end