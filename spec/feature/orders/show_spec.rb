require "rails_helper"

RSpec.describe "Orderss Index Page", type: :feature do
  # User Story 4, Child Show

  # As a visitor
  # When I visit '/child_table_name/:id'
  # Then I see the child with that id including the child's attributes
  # (data from each column that is on the child table)

  describe "User Story 4" do
    describe "As a visitor" do
      describe "When I visit '/child_table_name/:id'"
        it "I see the child with that id including the child's attributes" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)

          visit "/orders/#{order_1.id}"

          expect(page).to have_content(order_1.customer_id)
          expect(page).to have_content(order_1.product)
          expect(page).to have_content(order_1.price)
          expect(page).to have_content(order_1.piece)
          expect(page).to have_content(order_1.total_amount)
          expect(page).to have_content(order_1.shipped)
        end
    end
  end
end
