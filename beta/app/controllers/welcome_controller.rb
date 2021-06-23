class WelcomeController < ::ApplicationController
  def index
    @settings = Setting.all
  end
end
