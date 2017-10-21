class Admin::OrderController < Admin::AuthenticatedController

  def index
    @status = params[:id]
    if @status.blank?
      @status = 'todos'
      conditions = nil
      @page_title = "Listado de pedidos con estado #{@status}"
    else
      conditions = "status = '#{@status}'"
      @page_title = "Listado de pedidos con estado: #{@status}"

    end
    sort_by = params[:sort_by]
    @orders = Order.paginate :page => params[:page], :order => sort_by, :conditions => conditions, :per_page => 10
  end

  def show
    @order = Order.find(params[:id])
    @page_title = "Detalles del pedido ##{@order.id}"
  end

  def close
    order = Order.find(params[:id])
    order.close
    flash[:notice] = "El pedido ##{order.id} ha sido cerrado."
    redirect_to :action => 'index'
  end
  
   def destroy
    @order = Order.find(params[:id])
    @order.destroy
    flash[:notice] = "El pedido ##{@order.id} ha sido borrado."
    redirect_to :action => 'index'
  end
end
