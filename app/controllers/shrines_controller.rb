class ShrinesController < ApplicationController
  before_action :set_shrine, only: [:edit, :show, :update]

  def index
    @shrines = Shrine.all
  end

  def show
    @shrines = Shrine.all.limit(20).order(id: "DESC")
    @shrine_json = @shrine.to_json
    @festival = @shrine.festivals.new
    @festivals = @shrine.festivals.all.limit(10).order(id: "DESC")
    @goshuin = @shrine.goshuins.new
    @goshuins = @shrine.goshuins.all.limit(10).order(id: "DESC")
    @build = @shrine.builds.new
    @builds = @shrine.builds.all.limit(10).order(id: "DESC")
    @nature = @shrine.natures.new
    @natures = @shrine.natures.all.limit(10).order(id: "DESC")
    @history = @shrine.histories.new
    @histories = @shrine.histories.all.limit(10).order(id: "DESC")
  end

  def new
    @shrine = Shrine.new
  end

  def create
    @shrine = Shrine.new(shrine_params)
    
      if @shrine.save
        redirect_to root_path
      elsif 
        render :new
      end
  end

  def edit
  end

  def update
    if @shrine.update(shrine_params)
      redirect_to shrine_path
    else
      render :edit
    end
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end

  def set_shrine
    @shrine = Shrine.find(params[:id])
  end
end
