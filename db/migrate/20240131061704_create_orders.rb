class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :product
      t.integer :price
      t.integer :piece
      t.integer :total_amount
      t.boolean :shipped

      t.timestamps
    end
  end
end
