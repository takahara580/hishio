class Public::OrdersController < ApplicationController
  def index
    @order = Order.where(customer_id: current_customer).reverse_order
    @orders = @order.all
  end

  def new
    @order = Order.new
    @customer = current_customer
    @addresses = @customer.addresses
  end

  def confirm
    if params[:order]
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @cart_items = current_customer.cart_items
    @order.postage = 800


      if params[:order][:address_option] == "0"
        @order.zip_code = current_customer.zip_code
        @order.address = current_customer.address
        @order.name = current_customer.last_name + current_customer.first_name
      elsif params[:order][:address_option] == "1"
        if Address.exists?(id: params[:order][:registration_addresses])
          @address = Address.find(params[:order][:registration_addresses])
          @order.name = @address.name
          @order.zip_code = @address.zip_code
          @order.address = @address.address
        else
          flash[:notice] = "配送先情報がありません"
          render 'new'
        end
      elsif params[:order][:address_option] == "2"
        if params[:order][:zip_code].blank? || params[:order][:address].blank? || params[:order][:name].blank?
          flash[:danger] = "新しいお届け先の情報をすべて入力してください/郵便番号はハイフンを使わず7文字で入力してください。"
          redirect_to cart_items_path
          return
        else
          @order.name = params[:order][:name]
          @order.zip_code = params[:order][:zip_code]
          @order.address = params[:order][:address]
        end
      else
        render 'new'
      end
    end
  end

   def complete
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    current_customer.cart_items.each do |cart_item|
      order_detail = OrderDetail.new
      order_detail.order_id = order.id
      order_detail.item_id = cart_item.item_id
      order_detail.price = cart_item.item.non_taxed_price
      order_detail.amount = cart_item.amount
      order_detail.save
      cart_item.destroy
    end
    render 'thanks'
   end

  def show
    @order = Order.find_by(id: params[:id], customer_id: current_customer.id)
    if @order.nil?
      flash[:notice] = "指定されたオーダーが見つかりません"
      redirect_to cart_items_path
    else
      @order_details = OrderDetail.where(order_id: @order.id)
    end
  end

   private

  def order_params
   params.require(:order).permit(:customer_id, :name, :shipping_name, :zip_code, :address, :postage, :billing_amount, :payment_method)
  end
end
