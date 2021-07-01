class OrderCapturedSubscriber
  def self.call(data)
    mapped_data = {
      cart_guid: data.fetch(:guid),
      product:   data.fetch(:product),
      price:     data.fetch(:price),
      # TODO:             transition_events
      # fee_enabled:      data.fetch(:fee),
      # discount_enabled: data.fetch(:discount),
    }

    Order.create_from_cart!(mapped_data)
  rescue StandardError
    puts "an error happened but we're gonna keep rolling"
  end
end
