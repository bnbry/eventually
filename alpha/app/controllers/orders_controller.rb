class OrdersController < ::ApplicationController
  def update
    @order = Order.find(params[:id])
    ::OrderApprovedPublisher.call(@order)

    redirect_to "/transitions?pp=disable"
  end
end
