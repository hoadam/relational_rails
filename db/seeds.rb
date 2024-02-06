# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
customers = [
  { name: 'John Doe', phone: '123-456-7890', shipping_address: '123 Main St', billing_address: '456 Oak St', email: 'john@example.com', email_marketing: true },
  { name: 'Jane Smith', phone: '987-654-3210', shipping_address: '789 Maple St', billing_address: '101 Pine St', email: 'jane@example.com', email_marketing: false },
  { name: 'David Miller', phone: '321-654-0987', shipping_address: '54 Arch St', billing_address: '54 Arch St', email: 'david@example.com', email_marketing: true },
  { name: 'Olivia Brown', phone: '789-432-2345', shipping_address: '349 Apple St', billing_address: '349 Apple St', email: 'olivia@example.com', email_marketing: true },
  { name: 'Robert Wilson', phone: '234-890-9840', shipping_address: '325 Vernon St', billing_address: '325 Vernon St', email: 'robert@example.com', email_marketing: true },
  { name: 'Emma Jones', phone: '894-328-9234', shipping_address: '221 West St', billing_address: '221 West St', email: 'emma@example.com', email_marketing: false }
]

customer_ids = customers.map do |customer_attributes|
  Customer.create!(customer_attributes).id
end

orders = [
  { customer_id: customer_ids.sample, product: 'T-shirt', price: 20, piece: 2, total_amount: 40, shipped: true },
  { customer_id: customer_ids.sample, product: 'Dress', price: 15, piece: 3, total_amount: 45, shipped: false },
  { customer_id: customer_ids.sample, product: 'Jacket', price: 25, piece: 1, total_amount: 25, shipped: true },
  { customer_id: customer_ids.sample, product: 'T-shirt', price: 20, piece: 2, total_amount: 40, shipped: true },
  { customer_id: customer_ids.sample, product: 'T-shirt', price: 20, piece: 3, total_amount: 40, shipped: false },
  { customer_id: customer_ids.sample, product: 'Jacket', price: 25, piece: 1, total_amount: 25, shipped: true },
  { customer_id: customer_ids.sample, product: 'Jacket', price: 25, piece: 2, total_amount: 50, shipped: true },
  { customer_id: customer_ids.sample, product: 'Dress', price: 15, piece: 3, total_amount: 45, shipped: false },
  { customer_id: customer_ids.sample, product: 'Dress', price: 15, piece: 1, total_amount: 15, shipped: true },
  { customer_id: customer_ids.sample, product: 'T-shirt', price: 20, piece: 2, total_amount: 40, shipped: true },
  { customer_id: customer_ids.sample, product: 'Dress', price: 15, piece: 3, total_amount: 45, shipped: false }
]
orders.each do |order_attributes|
  Order.create!(order_attributes)
end
