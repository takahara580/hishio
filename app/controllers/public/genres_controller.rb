class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @producing_areas = ProducingArea.all
    @producing_area = ProducingArea.find(params[:id])
  end
end
