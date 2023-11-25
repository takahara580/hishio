class Public::ItemsController < ApplicationController
  
  def index
    @items = Item.all.page(params[:page]).per(8)
    @items_all = Item.all
    @genre = Genre.all
    @producing_area = ProducingArea.all
  end
  


  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @producing_areas = ProducingArea.all
    @cart_item = CartItem.new
  end

  def create
    @cart_product = CartItem.new
    @cart_items.save
    redirect_to cart_items_path
  end
  

  def search_name
    items_per_page = 8
    @content = params[:content]
    @records = Item.search_for(@content).page(params[:page]).per(items_per_page)
    @genres = Genre.all
    @producing_areas = ProducingArea.all
  end

end
