class ApplicationController < ActionController::Base
  after_action :drop_xframe

  def drop_xframe
    response.headers.delete('X-Frame-Options')
  end
end
