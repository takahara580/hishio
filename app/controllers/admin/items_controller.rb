class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @items = Item.page(params[:page]).per(15)
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      flash[:success] = "商品を保存しました。"
      redirect_to admin_item_path(@item.id)
    else
      flash[:danger] = "商品の内容に不備があります。"
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = "商品の変更内容を保存しました。"
      redirect_to admin_item_path(@item.id)
    else
      flash[:danger] = "商品の変更内容に不備があります。"
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_image, :text, :non_taxed_price, :genre_id, :name, :is_active, :producing_area_id)
  end
end