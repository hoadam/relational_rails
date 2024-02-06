require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe "relationship" do
    it { should have_many(:orders).dependent(:destroy)}
  end

  describe "#order_count" do
    it "returns the number of orders assiciated with the customer" do
      customer_1 = Customer.create!(name: "Juliet Eyraud")
      order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
      order_2 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 15, piece: 2, total_amount: 30, shipped: false)

      expect(customer_1.order_count).to eq(2)
    end
  end
end
