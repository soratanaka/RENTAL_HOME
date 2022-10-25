class HomesController < ApplicationController
  before_action :set_home, only: %i[ show edit update destroy ]

  def index
    @homes = Home.all
  end

  def show
    @nearest_stations = @home.nearest_stations
  end

  def new
    @home = Home.new
    2.times { @home.nearest_stations.new }
  end

  def edit
    @home.nearest_stations.new
  end

  def create
    @home = Home.new(home_params)
      if @home.save
        redirect_to home_path(@home.id), notice: "物件情報を登録しました"
      else
        render :new
      end
    end

  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: "物件情報を更新しました" }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: "物件情報を削除しました" }
      format.json { head :no_content }
    end
  end

  private
    def set_home
      @home = Home.find(params[:id])
    end

    def home_params
      params.require(:home).permit(:name, :price, :address, :age, :remarks,nearest_stations_attributes: [:id, :route, :station, :time])
    end
end
