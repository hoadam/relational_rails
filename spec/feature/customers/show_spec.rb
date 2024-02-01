require "rails_helper"

RSpec.describe "Customers Index Page", type: :feature do

# User Story 2, Parent Show

  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes
  # (data from each column that is on the parent table)

  describe "User Story 2" do
    describe "As a visitor" do
      describe "When I visit '/customers/:id'" do
        it "Then I see the customer with that id including the customer's attributes" do
          customer_1 = Customer.create!(name: "Juliet Eyraud", phone: "111-111-1111", email_marketing: true, orders_count: 5)

          visit "/customers/#{customer_1.id}"

          expect(page).to have_content(customer_1.name)
          expect(page).to have_content(customer_1.phone)
          expect(page).to have_content(customer_1.email_marketing)
          expect(page).to have_content(customer_1.orders_count)
        end
      end
    end
  end

end
