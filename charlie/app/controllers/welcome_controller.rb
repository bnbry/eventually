class WelcomeController < ::ApplicationController
  def index
    @setting = Setting.first
  end
end
