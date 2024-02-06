require "rails_helper"

RSpec.describe "Customers Index Page", type: :feature do

  describe "User Story 12" do
    describe "As a visitor" do
      describe "When I click the link 'Update Customer' on Customers Show Page" do
        it "see a form for a customer record and the button to submit the form" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          visit "/customers/#{customer_1.id}/edit"

          fill_in 'customer_name', with: 'Hoa Dam'

          click_button 'Update Customer'

          expect(page).to have_current_path("/customers/#{customer_1.id}")
          expect(page).to have_content('Hoa Dam')
        end
      end
    end
  end
end
