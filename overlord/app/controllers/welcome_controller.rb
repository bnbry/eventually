class WelcomeController < ::ApplicationController
  def index
    @messages = Message.last(10).reverse
  end
end
