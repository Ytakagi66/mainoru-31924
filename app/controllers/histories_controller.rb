class HistoriesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      @shrines = Shrine.all
      @history = @shrine.histories.new
      @histories = @shrine.histories.all.page(params[:page]).per(10).order(id: "DESC")
    else
      @temple = Temple.find(params[:temple_id])
      @temples = Temple.all
      @history = @temple.histories.new
      @histories = @temple.histories.all.page(params[:page]).per(10).order(id: "DESC")
    end
  end

  def show
    if params[:shrine_id]
      @histories = @shrine.histories.includes(:user,:shrine)
    else
      @histories = @temple.histories.includes(:user,:temple)
    end
  end
  
  def create
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      if @shrine.histories.create(shrine_params)
        redirect_to "/shrines/#{@shrine.id}/histories"
      else
        @histories = @shrine.histories.includes(:user)
        render :show
      end
    else
      @temple = Temple.find(params[:temple_id])
      if @temple.histories.create(temple_params)
        redirect_to "/temples/#{@temple.id}/histories"
      else
        @histories = @temple.histories.includes(:user)
        render :show
      end
    end
  end

  private
  def shrine_params
    params.require(:history).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
  def temple_params
    params.require(:history).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
