class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shrine = Shrine.find(@user.id)
    @shrines = Shrine.all
    @shrines_json = @shrines.to_json
  end
end
