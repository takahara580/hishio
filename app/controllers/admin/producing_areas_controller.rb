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
      redirect_to admin_producing_areas_path
    else
      render :index
    end
  end

  def edit
    @producing_area = ProducingArea.find(params[:id])
  end

  def update
    @producing_area = ProducingArea.find(params[:id])
    if @producing_area.update(producing_area_params)
      redirect_to admin_producing_areas_path
    else
      render :edit
    end
  end

  private

  def producing_area_params
    params.require(:producing_area).permit(:name)
  end
end
