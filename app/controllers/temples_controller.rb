class TemplesController < ApplicationController
  def index
    @temples = Shrine.all
  end

  def show
    @temple = Shrine.find(params[:id])
    @temples = Shrine.all.limit(20).order(id: "DESC")
    @temple_json = @temple.to_json
    @festival = @temple.festivals.new
    @festivals = @temple.festivals.all.limit(10).order(id: "DESC")
    @goshuin = @temple.goshuins.new
    @goshuins = @temple.goshuins.all.limit(10).order(id: "DESC")
    @build = @temple.builds.new
    @builds = @temple.builds.all.limit(10).order(id: "DESC")
    @nature = @temple.natures.new
    @natures = @temple.natures.all.limit(10).order(id: "DESC")
    @history = @temple.histories.new
    @histories = @temple.histories.all.limit(10).order(id: "DESC")    
  end

  def new
    @temple = Shrine.new
  end

  def create
    @temple = Shrine.new(temple_params)
    if @temple.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def temple_params
    params.require(:temple).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end  
end
