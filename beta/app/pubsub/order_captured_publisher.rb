class OrderCapturedPublisher
  def self.call(cart)
    ::UtilPublisher.call(
      event_name: "order_captured",
      data: {
        guid:     cart.guid,
        product:  cart.product,
        price:    cart.price,
        # TODO: transition_event
        # fee:      cart.fee,
        # discount: cart.discount,
      }
    )
  end
end
