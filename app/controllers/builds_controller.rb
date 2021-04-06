class BuildsController < ApplicationController
  def index
    @shrine = Shrine.find(params[:shrine_id])
    @shrines = Shrine.all
    @build = @shrine.builds.new
    @shrineBuilds = @shrine.builds.all.page(params[:page]).per(10)
  end

  def show
    @shrineBuilds = @shrine.builds.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.builds.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @builds = @shrine.builds.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:build).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
