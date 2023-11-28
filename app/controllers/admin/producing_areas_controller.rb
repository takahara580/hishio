class Admin::ProducingAreasController < ApplicationController
  before_action :authenticate_admin!

  def index
    @producing_areas = ProducingArea.all
    @producing_area = ProducingArea.new
  end

  def create
    @producing_areas = ProducingArea.all
    @producing_area = ProducingArea.new(producing_area_params)
    if @producing_area.save
      flash[:success] = "生産地を保存しました。"
      redirect_to admin_producing_areas_path
    else
      flash[:danger] = "生産地を入力してください"
      render :index
    end
  end

  def edit
    @producing_area = ProducingArea.find(params[:id])
  end

  def update
    @producing_area = ProducingArea.find(params[:id])
    if @producing_area.update(producing_area_params)
      flash[:success] = "生産地を変更しました。"
      redirect_to admin_producing_areas_path
    else
      flash[:danger] = "生産地を入力してください。"
      redirect_to admin_producing_areas_path
    end
  end

  private

  def producing_area_params
    params.require(:producing_area).permit(:name)
  end
end
