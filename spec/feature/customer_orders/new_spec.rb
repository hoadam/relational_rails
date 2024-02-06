require "rails_helper"

RSpec.describe "Customer_orders Index Page", type: :feature do
  # User Story 13, Parent Child Creation

  # As a visitor
  # When I visit a Parent Children Index page
  # Then I see a link to add a new adoptable child for that parent "Create Child"
  # When I click the link
  # I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
  # When I fill in the form with the child's attributes:
  # And I click the button "Create Child"
  # Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
  # a new child object/row is created for that parent,
  # and I am redirected to the Parent Childs Index page where I can see the new child listed

  describe "User Story 13" do
    describe "As a visitor" do
      describe "When I click the button 'Create Order'" do
        it "sees a form to add a new order of the customer and the button to submit the form" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")

          visit "/customers/#{customer_1.id}/orders/new"
          fill_in 'order_product', with: 'T-shirt'
          fill_in 'order_price', with: '25'
          fill_in 'order_piece', with: '1'
          fill_in 'order_total_amount', with: '25'
          check 'order_shipped'
          click_on 'Create Order'

          expect(page).to have_current_path("/customers/#{customer_1.id}/orders")
          expect(page).to have_content('T-shirt')
        end

      end
    end
  end
end
