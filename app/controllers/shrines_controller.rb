class ShrinesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :update, :edit]
  before_action :set_shrine, only: [:edit, :show, :update, :destroy]
  before_action :set_search, only: :index
  before_action :redirect_shrine, only: [:destroy]

  def index
    @shrines = Shrine.all.order(id: "DESC")
  end

  # 各テーブルに投稿されたカラムを投稿した日時が最新のものから順に表示する
  def show
    @shrines = Shrine.all.limit(20).order(id: "DESC")
    @shrine_json = @shrine.to_json
    @festival = @shrine.festivals.new
    @festivals = @shrine.festivals.all.limit(5).order(id: "DESC")
    @goshuin = @shrine.goshuins.new
    @goshuins = @shrine.goshuins.all.limit(5).order(id: "DESC")
    @build = @shrine.builds.new
    @builds = @shrine.builds.all.limit(5).order(id: "DESC")
    @nature = @shrine.natures.new
    @natures = @shrine.natures.all.limit(5).order(id: "DESC")
    @history = @shrine.histories.new
    @histories = @shrine.histories.all.limit(5).order(id: "DESC")
  end

  def new
    @shrine = Shrine.new
  end

  def create
    @shrine = Shrine.new(shrine_params)
      if @shrine.save
        redirect_to shrines_path
      elsif 
        render :new
      end
  end

  def edit
  end

  def update
    if @shrine.update(shrine_params)
      redirect_to shrine_path
    else
      render :edit
    end
  end

  def destroy
    @shrine.destroy
    redirect_to root_path
  end

  # 検索機能のメソッド
  def set_search
    @search = Shrine.ransack(params[:q]) #ransackの検索メソッド
    @search_shrines = @search.result(distinct: true).order(created_at: "DESC").includes(:user)
  end

  private

  def shrine_params
    params.require(:shrine).permit(:name, :info, :benefits_id, :address, :latitude, :longitude, images:[]).merge(user_id: current_user.id)
  end

  def set_shrine
    @shrine = Shrine.find(params[:id])
  end

  def redirect_shrine
    redirect_to root_path unless current_user.id == @shrine.user.id
  end

end
