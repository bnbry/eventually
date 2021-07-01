class Order < ApplicationRecord
  def self.create_from_cart!(cart_data)
    guid = "order-#{(Time.zone.now.to_f * 1000).to_i}"

    # TODO: transition_event
    if Setting.last.fee_enabled?
      fee = 25
    else
      fee = 0
    end

    if Setting.last.discount_enabled?
      discount = 10
    else
      discount = 0
    end

    order_data = {
      cart_guid: cart_data[:cart_guid],
      product:   cart_data[:product],
      price:     cart_data[:price],
      guid:      guid,
      fee:       fee,
      discount:  discount,
    }

    Order.create!(order_data)
  end
end
