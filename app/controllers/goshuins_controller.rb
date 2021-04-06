class GoshuinsController < ApplicationController
  def index
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      @shrines = Shrine.all
      @goshuin = @shrine.goshuins.new
      @goshuins = @shrine.goshuins.all.page(params[:page]).per(10)
    else
      @temple = Temple.find(params[:temple_id])
      @temples = Temple.all
      @goshuin = @temple.goshuins.new
      @goshuins = @temple.goshuins.all.page(params[:page]).per(10)
    end
  end

  def show
    if params[:shrine_id]
      @goshuins = @shrine.goshuins.includes(:user,:shrine)
    else
      @goshuins = @temple.goshuins.includes(:user,:temple)
    end
  end
  
  def create
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      if @shrine.goshuins.create(shrine_params)
        redirect_to "/shrines/#{@shrine.id}"
      else
        @goshuins = @shrine.goshuins.includes(:user)
        render :show
      end
    else
      @temple = Temple.find(params[:temple_id])
      if @temple.goshuins.create(temple_params)
        redirect_to "/temples/#{@temple.id}"
      else
        @goshuins = @temple.goshuins.includes(:user)
        render :show
      end
    end
  end

  private
  def shrine_params
    params.require(:goshuin).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
  def temple_params
    params.require(:goshuin).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
