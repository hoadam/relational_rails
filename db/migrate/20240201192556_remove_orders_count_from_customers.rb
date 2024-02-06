class RemoveOrdersCountFromCustomers < ActiveRecord::Migration[7.1]
  def change
    remove_column :customers, :orders_count
  end
end
