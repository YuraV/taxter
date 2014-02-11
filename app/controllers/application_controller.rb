class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!

  def store_location
    session[:return_to] = request.request_uri
  end

  def default_rescue
    session[:return_to] = root_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to(session[:return_to] || default_rescue, :alert => exception.message)
    session[:return_to] = nil
  end
end
