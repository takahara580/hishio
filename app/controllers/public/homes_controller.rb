class Public::HomesController < ApplicationController
  def top
    @items = Item.all
    @new_items = @items.sort_by { |item| item.created_at }.reverse.first(4)
    @top_items = Item.left_joins(:favorites)
                    .group(:id)
                    .order('COUNT(favorites.id) DESC')
                    .limit(4)
    @genre = Genre.all
    @producing_area = ProducingArea.all
  end
  
  def about
  end

end
