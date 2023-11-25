class Public::ProducingAreasController < ApplicationController
  def show
    @producing_areas = ProducingArea.all
    @producing_area = ProducingArea.find(params[:id])
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end
end
