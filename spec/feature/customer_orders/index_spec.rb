require "rails_helper"

RSpec.describe "CustomerOrders Index Page", type: :feature do
  # User Story 5, Parent Children Index

  # As a visitor
  # When I visit '/parents/:parent_id/child_table_name'
  # Then I see each Child that is associated with that Parent with each Child's attributes
  # (data from each column that is on the child table)

  describe "User Story 5" do
    describe "As a visitor" do
      describe "When I visit '/parents/:parent_id/child_table_name'" do
        it "see each Child that is associated with that Parent with each Child's attributes" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_3 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 2, total_amount: 50, shipped: true)

          visit "/customers/#{customer_1.id}/orders"

          expect(page).to have_content(order_1.customer_id)
          expect(page).to have_content(order_1.product)
          expect(page).to have_content(order_1.price)
          expect(page).to have_content(order_1.piece)
          expect(page).to have_content(order_1.total_amount)
          expect(page).to have_content(order_1.shipped)

          expect(page).to have_content(order_3.customer_id)
          expect(page).to have_content(order_3.product)
          expect(page).to have_content(order_3.price)
          expect(page).to have_content(order_3.piece)
          expect(page).to have_content(order_3.total_amount)
          expect(page).to have_content(order_3.shipped)
        end
      end
    end
  end
end
