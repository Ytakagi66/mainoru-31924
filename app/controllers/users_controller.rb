class UsersController < ApplicationController
  def show
    @shrines = Shrine.all
    @user = User.find(params[:id])
    gon.shrines = Shrine.where(user_id: @user.id)
    gon.temples = Temple.where(user_id: @user.id)
    gon.markerDataShrineFes = shrine_festival
  end

  private

    def shrine_festival
      @festival = Festival.where(user_id: @user.id)
      @festival.map{|festival|
        @festival_num = festival.id
      }
      @festivals = ShrineFestival.where(festival_id: @festival_num)
      @festivals.map{|festivals|
        @festivals_num = festivals.shrine_id
      }
      @shrineFestivals = Shrine.where(id: @festivals_num)
    end
end
