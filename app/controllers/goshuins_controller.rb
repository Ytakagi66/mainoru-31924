class GoshuinsController < ApplicationController
  def show
    @goshuins = @shrine.goshuins.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.goshuins.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @goshuins = @shrine.goshuins.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:goshuin).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
