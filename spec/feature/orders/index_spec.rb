require "rails_helper"

RSpec.describe "Orders Index Page", type: :feature do
  # User Story 3, Child Index

  # As a visitor
  # When I visit '/child_table_name'
  # Then I see each Child in the system including the Child's attributes
  # (data from each column that is on the child table)

  describe "User Story 3" do
    describe "As a visitor" do
      describe "When I visit '/orders'" do
        it "I see each order in the system including its attributes" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          customer_2 = Customer.create!(name: "Hoa Dam")


          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_2.id, product: "T-shirt", price: 25, piece: 2, total_amount: 50, shipped: false)

          visit "/orders"

          expect(page).to have_content(order_1.customer_id)
          expect(page).to have_content(order_1.product)
          expect(page).to have_content(order_1.price)
          expect(page).to have_content(order_1.piece)
          expect(page).to have_content(order_1.total_amount)
          expect(page).to have_content(order_1.shipped)

          expect(page).to have_content(order_2.customer_id)
          expect(page).to have_content(order_2.product)
          expect(page).to have_content(order_2.price)
          expect(page).to have_content(order_2.piece)
          expect(page).to have_content(order_2.total_amount)
          expect(page).to have_content(order_2.shipped)
        end
      end
    end
  end
end
