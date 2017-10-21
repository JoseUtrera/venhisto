# encoding: UTF-8

class PasswordResetController < ApplicationController
  before_filter :require_no_user

  def new
    @page_title = 'He olvidado mi Contraseña'
  end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      @user.reset_perishable_token!
      Notifier.password_reset_instructions(@user).deliver
      flash[:notice] = 'Le hemos enviado instrucciones para reestablecer su contraseña. ' +
                       'Por favor, compruebe su correo electrónico.'
      redirect_to :controller => 'user_session', :action => 'new'
    else
      @page_title = 'He olvidado mi Contraseña'
      flash[:notice] = 'No hemos encontrado ningún usuario con esa dirección de correo electrónico.'
      render :action => :new
    end
  end

  def edit
    load_user_using_perishable_token
    @page_title = 'Editar Contraseña'
  end

  def update
    @user = User.find_by_id(params[:user][:id])
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    if @user.save
      flash[:notice] = 'La contraseña ha sido actualizada con éxito. El usuario se ha conectado.'
      redirect_to :controller => 'user', :action => 'show'
    else
      @page_title = 'Editar Contraseña'
      render :action => :edit
    end
  end

  private

  def load_user_using_perishable_token
    @user = User.find_using_perishable_token(params[:id])
    unless @user
      flash[:notice] = 'Su cuenta no ha sido localizada. ' +
                       'Si usted no puede usar directamente la URL desde su correo electrónico,'+
                       'intente copiar y pegarla en su navegador o'+
                       'reinicie el proceso de cambio de contraseña.'
       redirect_to :controller => 'user_session', :action => 'new'
    end
  end
end
