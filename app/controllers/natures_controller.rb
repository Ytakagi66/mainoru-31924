class NaturesController < ApplicationController
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
