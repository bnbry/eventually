class ApplicationController < ActionController::Base
  after_action :drop_xframe
  protect_from_forgery with: :null_session

  def drop_xframe
    response.headers.delete('X-Frame-Options')
  end
end
