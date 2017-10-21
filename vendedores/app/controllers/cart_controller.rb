# encoding: utf-8

class CartController < ApplicationController

  #Ejecuta el método initialize_cart de la clase superior applicationController
  before_filter :initialize_cart

  def add
    @book = Book.find params[:id]
    @page_title = 'Añadir artículo'
    if request.xhr?
      @item = @cart.add params[:id]
      flash.now[:cart_notice] = "<em>#{@item.book.title}</em> añadido.".html_safe
      render :controller => 'cart', :action => 'add_with_ajax'
    elsif request.post?
      @item = @cart.add params[:id]
      flash[:cart_notice] = "<em>#{@item.book.title}</em> añadido.".html_safe
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'add', :template => 'cart/add'
    end
  end

  def remove
    @book = Book.find params[:id]
    @page_title = 'Eliminar libro'
    if request.xhr?
      @item = @cart.remove params[:id]
      flash.now[:cart_notice] = "Eliminado 1 <em>#{@item.book.title}</em>.".html_safe
      render :controller => 'cart', :action => 'remove_with_ajax'
    elsif request.post?
      @item = @cart.remove params[:id]
      flash[:cart_notice] = "Eliminado 1 <em>#{@item.book.title}</em>.".html_safe
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'remove', :template => 'cart/remove'
    end
  end


  def clear
    @page_title = 'Vaciar carrito'
    if request.xhr?
      @cart.cart_items.destroy_all 
      flash.now[:cart_notice] = "Carrito vacio"
      render :controller => 'cart', :action => 'clear_with_ajax'
    elsif request.post?
      @cart.cart_items.destroy_all
      flash[:cart_notice] = "Carrito vacio."
      redirect_to :controller => 'catalog'
    else
      render :controller => 'cart', :action => 'clear', :template => 'cart/clear'
    end
  end  
  
  
end
