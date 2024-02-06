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
          order_3 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 25, piece: 2, total_amount: 50, shipped: true)

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

  describe "User Story 13" do
    describe "As a visitor" do
      describe "When I visit the Customer_orders Index page" do
        it "sees a link to create a new order record for the specific customer" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_3 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 2, total_amount: 50, shipped: true)


          visit "/customers/#{customer_1.id}/orders"

          expect(page).to have_link("Create New Order",  href: "/customers/#{customer_1.id}/orders/new")
        end
      end
    end
  end

  describe "User Story 16" do
    describe "As a visitor" do
      describe "When I visit the customer_orders Index Page" do
        it "sees a link and when I click on the link, it takes me back to the customer_orders Index Page where I see all of the customer's orders in alphabetical order" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          order_1 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 15, piece: 2, total_amount: 30, shipped: true)

          visit "/customers/#{customer_1.id}/orders"
          click_link 'Sort Orders'

          expect(page).to have_current_path("/customers/#{customer_1.id}/orders?sort=asc")
          expect("Dress").to appear_before("T-shirt")
          expect("1").to appear_before("2")
          expect("25").to appear_before("30")
        end
      end
    end
  end

  describe "User Story 22" do
    describe "As a visitor" do
      describe "When I visit the customer orders index page" do
        it "sees a form that allows me to input a number value for total_amount, and click the submit button, then I am brought back to the current index page with only the orders that has total_amount bigger than the number value I entered" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          order_1 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 15, piece: 2, total_amount: 30, shipped: true)
          order_3 = Order.create!(customer_id: customer_1.id, product: "Jacket", price: 30, piece: 2, total_amount: 60, shipped: true)

          visit "/customers/#{customer_1.id}/orders"
          fill_in "Filter Total Amount:", with: 25
          click_on "Filter"

          expect(page).to have_content("T-shirt")
          expect(page).to have_content("Jacket")
          expect(page).not_to have_content("Dress")
        end
      end
    end
  end
end
