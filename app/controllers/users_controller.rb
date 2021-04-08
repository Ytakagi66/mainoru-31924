class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @shrine = Shrine.find(@user.id)
    @shrines = Shrine.all
  end
end
