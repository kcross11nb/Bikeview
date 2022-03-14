class BikesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def new
    @bike = Bike.new
  end
  def create
    @bike = current_user.bikes.build(bike_params)
    if @bike.save
      redirect_to bike_path(@bike), notice: "バイクを投稿しました。"
    else
      render :new
    end
  end
  def index
    @bikes = Bike.all.order(id: "DESC")
  end
  def show
    @bike = Bike.find(params[:id])
  end
  def edit
    @bike = Bike.find(params[:id])
    if @bike.user != current_user
        redirect_to bikes_path, alert: "不正なアクセスです。"
    end
  end
  def update
    @bike = Bike.find(params[:id])
    if @bike.update(bike_params)
      redirect_to bike_path(@bike), notice: "バイクを更新しました。"
    else
      render :edit
    end
  end
  def destroy
    bike = Bike.find(params[:id])
    bike.destroy
    redirect_to user_path(bike.user), notice: "バイクを削除しました。"
  end

  private
  def bike_params
    params.require(:bike).permit(:name, :description, :category, :cc, :top_photo, :photos)
  end
end
