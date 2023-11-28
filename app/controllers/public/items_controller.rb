class Public::ItemsController < ApplicationController
  
  def index
    case params[:sort_by]
    when "popular"
      @items = Item.left_joins(:favorites)
                   .group(:id)
                   .order('COUNT(favorites.id) DESC')
                   .page(params[:page])
                   .per(12)
    when "old"
      @items = Item.order(created_at: :asc).page(params[:page]).per(12)
    else 
      @items = Item.order(created_at: :desc).page(params[:page]).per(12)
    end

    @items = @items.page(params[:page]).per(12)
    @items_all = Item.all
    @genre = Genre.all
    @producing_area = ProducingArea.all
  end

  


  def show
    @item = Item.find(params[:id])
    @genre = Genre.all
    @producing_area = ProducingArea.all
    @cart_item = CartItem.new
    @item_comment = ItemComment.new
  end

  def create
    @cart_product = CartItem.new
    @cart_items.save
    redirect_to cart_items_path
  end
  

  def search_name
    items_per_page = 12
    @content = params[:content]
    @records = Item.search_for(@content).page(params[:page]).per(items_per_page)
    @genre = Genre.all
    @producing_area = ProducingArea.all
  end

end
