class Admin::OrderDetailsController < ApplicationController
  def update
    order_detail = OrderDetail.find(params[:id])
    order_detail.update(order_detail_params)

    case order_detail.creating_status
    when "発送準備中"
      order_detail.order.update(status: "発送準備中")
    when "発送準備完了"
      if order_detail.order.order_details.all? { |detail| detail.creating_status == "発送準備完了" }
        order_detail.order.update(status: "発送準備完了")
      end
    end

    redirect_to admin_order_path(order_detail.order.id)
  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:creating_status)
  end
end