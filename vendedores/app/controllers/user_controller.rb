# encoding: UTF-8

class UserController < ApplicationController
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
    @page_title = 'Crear Cuenta'
    if current_user
      flash[:notice] = 'Sólo se permite crear una cuenta por usuario.'
      redirect_to :controller => 'about', :action => 'index'
    else
      # only when there are no accounts it allows to create a new one, unique in the system
      redirect_to :controller => 'user_session', :action => 'new' unless User.count == 0
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save # the new user has been logged in automatically
      flash[:notice] = "Se ha creado con éxito una cuenta a nombre de #{@user.name} con el usuario #{@user.login}"
      redirect_to :action => 'show'
    else
      @page_title = 'Crear Cuenta'
      render :action => :new
    end
  end

  def edit
    @user = current_user
    @page_title = 'Editar cuenta'
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "La cuenta del usuario #{@user.login} se actualizó con éxito. "
      redirect_to :action => 'show'
    else
      @page_title = 'Editar cuenta'
      render :action => 'edit'
    end
  end

  def show
    @user = current_user
    @page_title = @user.login
  end
end