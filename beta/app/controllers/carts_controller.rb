class CartsController < ::ApplicationController
  def update
    @cart = Cart.find(params[:id])
    @cart.update!(update_params)
    ::OrderCapturedPublisher.call(@cart)

    redirect_to "/transitions?pp=disable"
  end

  private

  def update_params
    params
      .require(:cart)
      .permit(
        :product,
        :price
      )
  end
end
