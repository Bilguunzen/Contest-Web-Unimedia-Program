class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #before_action :site_path?
  include SessionsHelper
  include ContestsHelper
  include UsersHelper
  #filter resources and other cannot load paths

end
