class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_details
  end

  def update
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    if @order.update(order_params)
      @order_details.update_all(making_status: "waiting_making") if @order.status == "paid_up"
      redirect_to admin_order_path(@order)
    else
      render :show
    end
  end
  
  def index
    @orders = Order.all
    @customer = @orders.find_by(customer_id: customer.id)
    @customer_orders = @orders.where(customer_id: )
   
  end

  private

  def order_params
    params.require(:order).permit(:address, :name, :shipping_fee, :total_price, :payment_method, :status)
  end
end