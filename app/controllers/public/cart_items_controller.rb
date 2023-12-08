class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total_price = 0

    @cart_items.each do |cart_item|
      @total_price += cart_item.item.non_taxed_price * cart_item.amount
    end
  end

  def create
    @cart_item = CartItem.new(cart_items_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all

    @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item_id
        new_amount = (cart_item.amount || 0) + (@cart_item.amount || 0)
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
      end
    end

    @cart_item.save
    redirect_to cart_items_path
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_items_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def all_destroy
    @cart_items = current_customer.cart_items.all
    @cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_items_params
    params.require(:cart_item).permit(:item_id, :amount)
  end
end