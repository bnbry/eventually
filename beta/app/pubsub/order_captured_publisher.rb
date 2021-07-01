class OrderCapturedPublisher
  def self.call(cart)
    ::UtilPublisher.call(
      event_name: "order_captured",
      data: {
        guid:    cart.guid,
        product: cart.product,
        price:   cart.price,
      }
    )
  end
end
