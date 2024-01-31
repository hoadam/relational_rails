class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :phone
      t.string :shipping_address
      t.string :billing_address
      t.string :email
      t.boolean :email_marketing
      t.integer :orders

      t.timestamps
    end
  end
end
