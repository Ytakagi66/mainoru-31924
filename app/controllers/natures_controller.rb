class NaturesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      @shrines = Shrine.all
      @nature = @shrine.natures.new
      @natures = @shrine.natures.all.page(params[:page]).per(10).order(id: "DESC")
    else
      @temple = Temple.find(params[:temple_id])
      @temples = Temple.all
      @nature = @temple.natures.new
      @natures = @temple.natures.all.page(params[:page]).per(10).order(id: "DESC")
    end
  end

  def show
    if params[:shrine_id]
      @natures = @shrine.natures.includes(:user,:shrine)
    else
      @natures = @temple.natures.includes(:user,:temple)
    end
  end
  
  def create
    if params[:shrine_id]
      @shrine = Shrine.find(params[:shrine_id])
      if @shrine.natures.create(shrine_params)
        redirect_to "/shrines/#{@shrine.id}/natures"
      else
        @natures = @shrine.natures.includes(:user)
        render :show
      end
    else
      @temple = Temple.find(params[:temple_id])
      if @temple.natures.create(temple_params)
        redirect_to "/temples/#{@temple.id}/natures"
      else
        @natures = @temple.natures.includes(:user)
        render :show
      end
    end
  end

  private
  def shrine_params
    params.require(:nature).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
  def temple_params
    params.require(:nature).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
