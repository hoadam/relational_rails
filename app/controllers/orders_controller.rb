class OrdersController < ApplicationController
  def index
    @orders = Order.all

    if params[:sort]
        @orders = Order.where(shipped: true)
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    order = Order.find(params[:id])

    order.update({
      product: order_params[:product],
      price: order_params[:price],
      piece: order_params[:piece],
      total_amount: order_params[:total_amount],
      shipped: order_params[:shipped]
    })
    order.save
    redirect_to "/orders/#{order.id}"
  end

  def destroy
    Order.destroy(params[:id])
    redirect_to '/orders'
  end

  private

  def order_params
    params[:order]
  end
end
