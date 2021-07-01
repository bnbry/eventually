class TransitionsController < ::ApplicationController
  def index
    @cart = Cart.with_current_settings
  end
end
