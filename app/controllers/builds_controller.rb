class BuildsController < ApplicationController
  def show
    @builds = @shrine.builds.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.builds.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @builds = @shrine.builds.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:build).permit(:title, :text, :image).merge(user_id: current_user.id)
  end  
end
