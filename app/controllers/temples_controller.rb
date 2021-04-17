class TemplesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :set_temple, only: [:edit, :show, :update]
  before_action :set_search

  def index
    @temples = Temple.all
  end

  def show
    @temples = Temple.all.limit(20).order(id: "DESC")
    @temple_json = @temple.to_json
    @festival = @temple.festivals.new
    @festivals = @temple.festivals.all.limit(10).order(id: "DESC")
    @goshuin = @temple.goshuins.new
    @goshuins = @temple.goshuins.all.limit(10).order(id: "DESC")
    @build = @temple.builds.new
    @builds = @temple.builds.all.limit(10).order(id: "DESC")
    @nature = @temple.natures.new
    @natures = @temple.natures.all.limit(10).order(id: "DESC")
    @history = @temple.histories.new
    @histories = @temple.histories.all.limit(10).order(id: "DESC")    
  end

  def new
    @temple = Temple.new
  end

  def create
    @temple = Temple.new(temple_params)
    if @temple.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @temple.update(temple_params)
      redirect_to temple_path
    else
      render :edit
    end
  end

  def set_search
    @search = Temple.ransack(params[:q]) #ransackの検索メソッド
    @search_temples = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
  end

  private

  def temple_params
    params.require(:temple).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images: []).merge(user_id: current_user.id)
  end  

  def set_temple
    @temple = Temple.find(params[:id])
  end
end
