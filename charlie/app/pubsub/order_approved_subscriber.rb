class OrderApprovedSubscriber
  def self.call(data)
    mapped_data = {
      total:   data.fetch(:total),
      guid:    data.fetch(:guid),
      product: data.fetch(:product),
      fee:     data.fetch(:fee, 0) > 0,
    }

    ::Order.create_from_approved!(mapped_data)
  end
end
