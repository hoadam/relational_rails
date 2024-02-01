class CustomerOrdersController < ApplicationController
  def index
    @customer = Customer.find(params[:id])
    @orders = @customer.orders
  end
end
