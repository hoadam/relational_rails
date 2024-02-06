class CustomersController < ApplicationController
  def index
    @customers = Customer.order(created_at: :desc)

    if params[:sort]
      @customers = @customers.sort_by {|customer| -customer.order_count}
    end

    if params[:filter_by_name]
      @customers = @customers.where("name ILIKE ?", params[:filter_by_name])
    end

    if params[:filter_by_partial_name]
      @customers = @customers.where("name ILIKE ?", "%#{params[:filter_by_partial_name]}%" )
    end
  end

  def show
    @customer = Customer.find(params[:id])
    @total_orders = @customer.order_count
  end

  def new
    @customer = Customer.new()
  end

  def create
    customer = Customer.new({
      name: customer_params[:name],
      phone: customer_params[:phone],
      shipping_address: customer_params[:shipping_address],
      billing_address: customer_params[:billing_address],
      email: customer_params[:email],
      email_marketing: customer_params[:email_marketing],
    })

    customer.save
    redirect_to '/customers'
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])

    customer.update({
      name: customer_params[:name],
      phone: customer_params[:phone],
      shipping_address: customer_params[:shipping_address],
      billing_address: customer_params[:billing_address],
      email: customer_params[:email],
      email_marketing: customer_params[:email_marketing]
    })
    customer.save
    redirect_to "/customers/#{customer.id}"
  end

  def destroy
    Customer.destroy(params[:id])
    redirect_to '/customers'
  end

  private

  def customer_params
    params[:customer]
    # params.require(:customer).permit(....)
  end
end
