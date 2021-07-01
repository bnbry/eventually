class OrderApprovedPublisher
  def self.call(order)
    ::UtilPublisher.call(
      event_name: "order_approved",
      data: {
        guid:    order.guid,
        product: order.product,
        total:   order.price + order.fee - order.discount,
      }
    )
  end
end
