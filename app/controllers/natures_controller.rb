class NaturesController < ApplicationController
  def index
    @shrine = Shrine.find(params[:shrine_id])
    @shrines = Shrine.all
    @nature = @shrine.natures.new
    @natures = @shrine.natures.all.page(params[:page]).per(10)
  end

  def show
    @natures = @shrine.natures.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.natures.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @natures = @shrine.natures.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:nature).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
