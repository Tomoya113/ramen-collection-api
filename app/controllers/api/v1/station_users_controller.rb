class StationUsersController < ApplicationController
  def register
    StationUser.create({
      user_id: params[:user_id],
      station_id: params[:station_id]
    })
  end
end
