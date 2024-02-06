require "rails_helper"

RSpec.describe "Customers Index Page", type: :feature do
  describe "User Story 5" do
    describe "As a visitor" do
      describe "When I visit '/customers" do
        it "see the name of each parent record in the system" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          customer_2 = Customer.create!(name: "Hoa Dam")
          customer_3 = Customer.create!(name: "Abdul Redd")

          visit "/customers"

          expect(page).to have_content("Juliet Eyraud")
          expect(page).to have_content("Hoa Dam")
          expect(page).to have_content("Abdul Redd")
          expect(page).to have_content(customer_1.created_at)
          expect(page).to have_content(customer_2.created_at)
          expect(page).to have_content(customer_3.created_at)
        end
      end
    end
  end

  describe "User Story 11" do
    describe "As a visitor" do
      describe "When I visit the Customer Index page" do
        it "sees a link to create a new customer record" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          customer_2 = Customer.create!(name: "Hoa Dam")
          customer_3 = Customer.create!(name: "Abdul Redd")

          visit "/customers"

          expect(page).to have_link("Create New Customer",  href: "/customers/new")
        end
      end
    end
  end

  describe "User Story 17" do
    describe "As a visitor" do
      describe "When I visit the customers index page" do
        it "sees a link to edit the customer's information next to every customer and when I click the link, it takes me the customer's edit page" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          customer_2 = Customer.create!(name: "Hoa Dam")
          customer_3 = Customer.create!(name: "Abdul Redd")

          visit "/customers"

          expect(page).to have_link("Edit Customer's Information",  href: "/customers/#{customer_1.id}/edit")
          expect(page).to have_link("Edit Customer's Information",  href: "/customers/#{customer_2.id}/edit")
          expect(page).to have_link("Edit Customer's Information",  href: "/customers/#{customer_3.id}/edit")
        end
      end
    end
  end

  describe "User Story 23" do
    describe "As a visitor" do
      describe "When I visit the customers index page" do
        it "sees a link to delete the customer and then I am redirected to the customers index page where I no longer see this customer" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          customer_2 = Customer.create!(name: "Hoa Dam")
          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)
          order_2 = Order.create!(customer_id: customer_2.id, product: "Dress", price: 15, piece: 2, total_amount: 30, shipped: false)

          visit "/customers"

          page.find(%(.delete-customer-btn[href="/customers/#{customer_1.id}"])).click

          expect(page).to have_current_path("/customers")
          expect(page).not_to have_content("Juliet Eyraud")
          expect(page).to have_content("Hoa Dam")

          visit "/orders"
          expect(page).not_to have_content("T-shirt")
        end
      end
    end
  end
end
