class FestivalsController < ApplicationController
  def index
    @shrine = Shrine.find(params[:shrine_id])
    @shrines = Shrine.all
    @festival = @shrine.festivals.new
    @festivals = @shrine.festivals.all.page(params[:page]).per(10)
  end

  def show
    @festivals = @shrine.festivals.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.festivals.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @festivals = @shrine.festivals.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:festival).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
