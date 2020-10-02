module Api
  module V1
    class ShopUsersController < ApplicationController
      def finish
        shop_user = ShopUser.find_by(shop_id: params[:shop_id], user_id: params[:user_id])
      end
    end
  end
end