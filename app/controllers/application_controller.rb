class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def index
    @awesome = true
  end
end
