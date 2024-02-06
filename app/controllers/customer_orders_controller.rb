class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
    if params[:sort]
      @orders = @orders.order(:product)
    end

    if params[:filter_total_amount]
      @orders = @orders.where("total_amount > ?", params[:filter_total_amount])
    end
  end

  def new
    @customer = Customer.find(params[:id])
    @order = @customer.orders.new()
  end

  def create
    customer = Customer.find(params[:id])
    order = customer.orders.create({
      product: order_params[:product],
      price: order_params[:price],
      piece: order_params[:piece],
      total_amount: order_params[:total_amount],
      shipped: order_params[:shipped]
    })

    redirect_to "/customers/#{customer.id}/orders"
  end

  private

  def order_params
    params[:order]
  end

end
