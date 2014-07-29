class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :initialize_cart
  
  private

  def initialize_cart
    session[:cart_id] ||= nil
  end
end
