class ShrinesController < ApplicationController
  def index
    @shrines = Shrine.all.page(params[:page])
  end

  def show
    @shrine = Shrine.find(params[:id])
    @shrine_json = @shrine.to_json
  end

  def new
    @shrine = Shrine.new
  end

  def create
    @shrine = Shrine.new(shrine_params)
    if @shrine.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end
end
