require "rails_helper"

RSpec.describe "Customers Index Page", type: :feature do

  # User Story 2, Parent Show
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  # User Story 7, Parent Child Count
  # As a visitor
  # When I visit a parent's show page
  # I see a count of the number of children associated with this parent

  describe "User Story 7" do
    describe "As a visitor" do
      describe "When I visit '/customers/:id'" do
        it "I see a count of the number of children associated with this parent" do
          customer_1 = Customer.create!(name: "Juliet Eyraud", phone: "111-111-1111", email_marketing: true)

          visit "/customers/#{customer_1.id}"

          expect(page).to have_content(customer_1.name)
          expect(page).to have_content(customer_1.phone)
          expect(page).to have_content(customer_1.email_marketing)
          expect(page).to have_content(customer_1.orders.count)
        end
      end
    end
  end

  # User Story 10, Parent Child Index Link
  # As a visitor
  # When I visit a parent show page ('/parents/:id')
  # Then I see a link to take me to that parent's `child_table_name` page ('/parents/:id/child_table_name')

  describe "User Story 10" do
    describe "As a visitor" do
      describe "When I visit '/customers/:id'" do
        it "see a link to take me to that customer's `orders` page ('/customers/:id/orders')" do
          customer_1 = Customer.create!(name: "Juliet Eyraud", phone: "111-111-1111", email_marketing: true)

          visit "/customers/#{customer_1.id}"

          expect(page).to have_content(customer_1.name)
          expect(page).to have_content(customer_1.phone)
          expect(page).to have_content(customer_1.email_marketing)
          expect(page).to have_content(customer_1.orders.count)
          expect(page).to have_link("View orders from #{customer_1.name}",  href: "/customers/#{customer_1.id}/orders")
        end
      end
    end
  end

  describe "User Story 12" do
    describe "As a visitor" do
      describe "When I visit the Customer Show page" do
        it "sees a link to edit customer record" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          customer_2 = Customer.create!(name: "Hoa Dam")
          customer_3 = Customer.create!(name: "Abdul Redd")

          visit "/customers/#{customer_1.id}"

          expect(page).to have_link("Edit Customer's Information",  href: "/customers/#{customer_1.id}/edit")
        end
      end
    end
  end

  describe "User Story 19" do
    describe "As a visitor" do
      describe "When I visit the customers show page" do
        it "sees a link to delete the customer and then I am redirected to the customers index page where I no longer see this customer" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 15, piece: 2, total_amount: 30, shipped: true)

          visit "/customers/#{customer_1.id}"

          click_on "Delete Customer"

          expect(page).to have_current_path("/customers")
          expect(page).not_to have_content("Juliet Eyraud")

          visit "/orders"
          expect(page).not_to have_content("T-shirt")
        end
      end
    end
  end
end
