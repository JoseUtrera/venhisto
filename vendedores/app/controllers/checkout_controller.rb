# encoding: utf-8

class CheckoutController < ApplicationController

  before_filter :initialize_cart, :only => :index
  
  def index
    @order = Order.new
    @page_title = 'Realizar Pedido'
    if @cart.books.empty?
      flash[:notice] = '¡Su carrito se encuentra vacío! ' +
                       'Por favor, añada al menos un libro antes de proceder a realizar el pedido.'
      redirect_to :controller => 'catalog'
    end
  end

  def submit_order
    @cart = Cart.find(params[:cart][:id]) # Search the cart from the cart id hidden field of the form
    @order = Order.new(params[:order])
    @order.customer_ip = request.remote_ip
    @order.status = 'abierto'
    @page_title = 'Realizar Pedido'
    populate_order

    if @order.save
      if @order.process
        flash[:notice] = 'Su pedido se procesará inmediatamente.'
        session[:order_id] = @order.id
        @cart.cart_items.destroy_all # empty shopping cart
        redirect_to :action => 'thank_you'
      else
        flash[:notice] = "Error al procesar el pedido '#{@order.error_message}'."
        render :action => 'index'
      end
    else
      render :action => 'index'
    end
  end
  
  def thank_you
    @page_title = 'Gracias'
  end

  private

  def populate_order
    for cart_item in @cart.cart_items
      order_item = OrderItem.new(:book_id => cart_item.book_id,
                                 :price => cart_item.price,
                                 :amount => cart_item.amount)
      @order.order_items << order_item
    end
  end

end
