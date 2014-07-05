class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_carrito
  #skip_before_action :verify_authenticity_token, if: :check_token?

  private
 
  # Finds the User with the ID stored in the session with the key
  # :current_user_id This is a common way to handle user login in
  # a Rails application; logging in sets the session value and
  # logging out removes it.
  def set_carrito
    session[:carrito] ||= []
  end

  #def check_token?
    #return true if self.class == CarritoController && self.action_name == "pagado"
    # do your thing
    #false
  #end
end
