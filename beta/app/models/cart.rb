class Cart < ApplicationRecord
  def self.with_current_settings
    # todo: change_events
    cart = Cart.find_by(guid: "cart-12345678")
    cart.update(
      fee:      false, # Setting.find_by(name: "fee").enabled?,
      discount: false, # Setting.find_by(name: "discount").enabled?,
    )
    cart
  end
end
