class Order < ApplicationRecord
  def self.create_from_approved!(mapped_data)
    Order.last.update(mapped_data)
  end
end
