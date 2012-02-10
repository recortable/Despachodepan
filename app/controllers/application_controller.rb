class ApplicationController < ActionController::Base
  protect_from_forgery
  include Extensions::ExposeResource



end
