require "rails_helper"

RSpec.describe "Customers Index Page", type: :feature do
  # User Story 1, Parent Index

  # For each parent table
  # As a visitor
  # When I visit '/parents'
  # Then I see the name of each parent record in the system

  describe "User Story 1" do
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

        end
      end
    end
  end

end
