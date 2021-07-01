class TransitionsController < ::ApplicationController
  def index
    @order = Order.last
  end
end
