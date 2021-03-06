class CommentsController < ApplicationController

  def show
    @comments = @shrine.comments.includes(:user,:shrine)
  end
  
  def create
    @shrine = Shrine.find(params[:shrine_id])
    if @shrine.comments.create(shrine_params)
      redirect_to "/shrines/#{@shrine.id}"
    else
      @comments = @shrine.comments.includes(:user)
      render :show
    end
  end

  private
  def shrine_params
    params.require(:comment).permit(:text, :image).merge(user_id: current_user.id)
  end
end