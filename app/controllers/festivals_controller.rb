class FestivalsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      @shrines = Shrine.all
      @festival = @shrine.festivals.new
      @festivals = @shrine.festivals.all.page(params[:page]).per(10).order(id: "DESC")
    else
      @temple = Temple.find(params[:temple_id])
      @temples = Temple.all
      @festival = @temple.festivals.new
      @festivals = @temple.festivals.all.page(params[:page]).per(10).order(id: "DESC")
    end
  end

  def show
    if params[:shrine_id]
      @festivals = @shrine.festivals.includes(:user,:shrine)
    else
      @festivals = @temple.festivals.includes(:user,:temple)
    end
  end
  
  def create
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      if @shrine.festivals.create(shrine_params)
        redirect_to "/shrines/#{@shrine.id}/festivals"
      else
        @festivals = @shrine.festivals.includes(:user)
        render :show
      end
    else
      @temple = Temple.find(params[:temple_id])
      if @temple.festivals.create(temple_params)
        redirect_to "/temples/#{@temple.id}/festivals"
      else
        @festivals = @temple.festivals.includes(:user)
        render :show
      end
    end
  end

  private
  def shrine_params
    params.require(:festival).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
  def temple_params
    params.require(:festival).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
