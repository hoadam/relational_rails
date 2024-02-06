require "rails_helper"

RSpec.describe "Orders Index Page", type: :feature do
  # User Story 14, Child Update

  # As a visitor
  # When I visit a Child Show page
  # Then I see a link to update that Child "Update Child"
  # When I click the link
  # I am taken to '/child_table_name/:id/edit' where I see a form to edit the child's attributes:
  # When I click the button to submit the form "Update Child"
  # Then a `PATCH` request is sent to '/child_table_name/:id',
  # the child's data is updated,
  # and I am redirected to the Child Show page where I see the Child's updated information

  describe "User Story 14" do
    describe "As a visitor" do
      describe "When I click the link 'Update Order' on Customers Show Page" do
        it "see a form for a new customer record and the button to submit the form" do
          customer_1 = Customer.create!(name: "Juliet Eyraud")
          order_1 = Order.create!(customer_id: customer_1.id, product: "T-shirt", price: 25, piece: 1, total_amount: 25, shipped: true)

          visit "/orders/#{order_1.id}/edit"

          fill_in 'order_piece', with: 4

          click_button 'Update Order'

          expect(page).to have_current_path("/orders/#{order_1.id}")
          expect(page).to have_content(4)
        end
      end
    end
  end
end
