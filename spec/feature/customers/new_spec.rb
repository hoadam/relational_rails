require "rails_helper"

RSpec.describe "Customers Index Page", type: :feature do
  # User Story 11, Parent Creation

  # As a visitor
  # When I visit the Parent Index page
  # Then I see a link to create a new Parent record, "New Parent"
  # When I click this link
  # Then I am taken to '/parents/new' where I  see a form for a new parent record
  # When I fill out the form with a new parent's attributes:
  # And I click the button "Create Parent" to submit the form
  # Then a `POST` request is sent to the '/parents' route,
  # a new parent record is created,
  # and I am redirected to the Parent Index page where I see the new Parent displayed.
  describe "User Story 11" do
    describe "As a visitor" do
      describe "When I click the link 'Create New Customer'" do
        it "see a form for a new customer record and the button to submit the form" do
          visit "/customers/new"

          fill_in 'customer_name', with: 'John Doe'
          fill_in 'customer_phone', with: '123-456-7890'
          fill_in 'customer_shipping_address', with: '123 Main St'
          fill_in 'customer_billing_address', with: '123 Main St'
          fill_in 'customer_email', with: 'john@example.com'
          check 'customer_email_marketing'
          click_button 'Create Customer'

          expect(page).to have_current_path("/customers")
          expect(page).to have_content('John Doe')
        end
      end
    end


  end
end
