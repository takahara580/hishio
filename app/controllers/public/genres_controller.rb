class Public::GenresController < ApplicationController
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @producing_areas = ProducingArea.all
    @producing_area = ProducingArea.find(params[:id])

    sort_type = params[:sort_type]
    @genre_items = sort_items(sort_type, @genre.items).page(params[:page]).per(12)
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
    else
      items
    end
  end
end
