class ShrinesController < ApplicationController
  def index
    @shrines = Shrine.all
    @temples = Temple.all
  end

  def show
    if @shrine = Shrine.find(params[:id])
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
    
    else @temple = Temple.find(params[:id])
    @temples = Temple.all.limit(20).order(id: "DESC")
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
  end

  def new
    @shrine = Shrine.new
    @temple = Temple.new
  end

  def create
    @shrine = Shrine.new(shrine_params)
    @temple = Temple.new(temple_params)
    
      if @shrine.save || @temple.save
        redirect_to root_path
      elsif 
        render :new
      end
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end

  def temple_params
    params.require(:temple).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end
end
