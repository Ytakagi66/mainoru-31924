class ShrinesController < ApplicationController
  def index
    @shrines = Shrine.all.page(params[:page])
  end

  def show
    @Shrine = Shrine.find(params[:id])
  end

  def new
    @shrine = Shrine.new
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end
end
