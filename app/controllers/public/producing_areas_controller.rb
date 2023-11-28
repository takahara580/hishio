class Public::ProducingAreasController < ApplicationController
  def show
    @producing_areas = ProducingArea.all
    @producing_area = ProducingArea.find(params[:id])
    @genres = Genre.all
    @genre = Genre.find(params[:id])

    sort_type = params[:sort_type]
    @producing_area_items = sort_items(sort_type, @producing_area.items).page(params[:page]).per(12)
  end

  private

  def sort_items(sort_type, items)
    case sort_type
    when 'popular'
      items.left_joins(:favorites)
           .group(:id)
           .order('COUNT(favorites.id) DESC')
    when 'old'
      items.order(created_at: :asc)
    when 'latest'
      items.order(created_at: :desc)
    when 'active'
      items.where(is_active: true).order(created_at: :desc)
    else
      items
    end
  end
end