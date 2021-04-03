class ShrinesController < ApplicationController
  def index
    @shrines = Shrine.all
  end

  def show
    @shrine = Shrine.find(params[:id])
    @shrine_json = @shrine.to_json
    @comment = @shrine.comments.new
    @comments = @shrine.comments.all.limit(10).order(id: "DESC")
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
    else
      render :new
    end
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end

end
