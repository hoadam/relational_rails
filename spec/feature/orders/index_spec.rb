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
        it "sees all orders in the system including its attributes" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 15, piece: 2, total_amount: 30, shipped: false)

          visit "/orders"

          expect(page.all('.order').count).to eq(2)
        end
      end
    end
  end

  describe "User Story 15" do
    describe "As a visitor" do
      describe "When I visit '/orders'" do
        it "sees only shipped orders in the system including its attributes" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 15, piece: 2, total_amount: 30, shipped: false)

          visit "/orders?sort=shipped"

          expect(page.all('.order').count).to eq(1)

          within '.order' do
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
  end

  describe "User Story 18" do
    describe "As a visitor" do
      describe "When I visit the orders index page" do
        it "sees a link to edit the order's information next to every order and when I click the link, it takes me the order's edit page" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 15, piece: 2, total_amount: 30, shipped: false)

          visit "/orders"

          expect(page).to have_link("Edit Order",  href: "/orders/#{order_1.id}/edit")
          expect(page).to have_link("Edit Order",  href: "/orders/#{order_2.id}/edit")
        end
      end
    end
  end

  describe "User Story 20" do
    describe "As a visitor" do
      describe "When I visit the orders index page" do
        it "sees a link to delete the order and then I am redirected to the orders index page where I no longer see this order" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_1.id, product: "Dress", price: 15, piece: 2, total_amount: 30, shipped: false)
          visit "/orders"

          page.find(%(.delete-order-btn[href="/orders/#{order_1.id}"])).click

          expect(page).to have_current_path("/orders")
          expect(page.all('.order').count).to eq(1)
        end
      end
    end
  end
end
