class Customer < ApplicationRecord
  has_many :orders, dependent: :destroy

  def order_count
    @order_count ||= self.orders.count
  end
end
