class ApplicationController < ActionController::Base
  protect_from_forgery

  #-- need the line below?--
  # before_filter :authenticate_user!
end
