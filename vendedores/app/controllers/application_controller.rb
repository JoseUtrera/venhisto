# encoding: UTF-8

class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user_session, :current_user

  private

  def initialize_cart
    if session[:cart_id]
    #Si hay carrito, cargamos el carrito con el id de ese objeto
      @cart = Cart.find session[:cart_id]
    else
    #Si no hay carrito, creamos uno nuevo y almacenamos el id del carrito en la sesion  
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end
  end
  
  def current_user_session
    logger.debug "ApplicationController::current_user_session"
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    logger.debug "ApplicationController::current_user"
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.user
  end

  def require_user
    logger.debug "ApplicationController::require_user"
    unless current_user
      store_location
      flash[:notice] = "Para acceder a esta página debes estar conectado con un usuario."
      redirect_to :controller => '/user_session', :action => 'new'
      return false
    end
  end

  def require_no_user
    logger.debug "ApplicationController::require_no_user"
    if current_user
      # store_location # not necessary since logout route is predetermined
      flash[:notice] = "Para acceder a esta página debes antes desconectar tu usuario."
      redirect_to :controller => 'about', :action => :index
      return false
    end
  end

  def store_location
    session[:return_to] = request.url
  end

  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
end