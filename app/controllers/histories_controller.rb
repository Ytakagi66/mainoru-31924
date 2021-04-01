class HistoriesController < ApplicationController
  def show
    @histories = @shrine.histories.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.histories.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @histories = @shrine.histories.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:history).permit(:title, :text, :image).merge(user_id: current_user.id)
  end
end
