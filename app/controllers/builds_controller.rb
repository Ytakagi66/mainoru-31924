class BuildsController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      @shrines = Shrine.all
      @build = @shrine.builds.new
      @builds = @shrine.builds.all.page(params[:page]).per(10).order(id: "DESC")
    else
      @temple = Temple.find(params[:temple_id])
      @temples = Temple.all
      @build = @temple.builds.new
      @builds = @temple.builds.all.page(params[:page]).per(10).order(id: "DESC")
    end
  end

  def show
    if params[:shrine_id]
      @builds = @shrine.builds.includes(:user,:shrine)
    else
      @builds = @temple.builds.includes(:user,:temple)
    end
  end
  
  def create
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      if @shrine.builds.create(shrine_params)
        redirect_to "/shrines/#{@shrine.id}/builds"
      else
        @builds = @shrine.builds.includes(:user)
        render :show
      end
    else
      @temple = Temple.find(params[:temple_id])
      if @temple.builds.create(temple_params)
        redirect_to "/temples/#{@temple.id}/builds"
      else
        @builds = @temple.builds.includes(:user)
        render :show
      end
    end
  end

  private
  def shrine_params
    params.require(:build).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
  def temple_params
    params.require(:build).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
