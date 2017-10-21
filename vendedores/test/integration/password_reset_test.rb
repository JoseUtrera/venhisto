# encoding: UTF-8
require File.dirname(__FILE__) + '/../test_helper'

class ForgotPasswordTest < ActionDispatch::IntegrationTest

  def setup
    User.create(:name => 'George Smith', :login => 'george', :email => 'george@emporium.com',
                :password => 'cheetah', :password_confirmation => 'cheetah')
  end

  test "forgot_password" do
    george = new_session_as(:george)
    george.goes_to_forgot_password_form
    george.sends_mistaken_email(:email => 'george@bookshop.com')
    george.sends_correct_email(:email => 'george@emporium.com')
    george.resets_mismatched_password(:user => { :id => User.find(:all).first.id, :password => 'Gold',
                                                 :password_confirmation => 'Silver' })
    george.resets_correct_password(:user => { :id => User.find(:all).first.id, :password => 'Gold',
                                              :password_confirmation => 'Gold' })
  end

  private

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def goes_to_forgot_password_form
      get '/password_reset/new'
      assert_response :success
      assert_template 'password_reset/new'
      assert_tag :tag => 'h1', :content => 'He olvidado mi Contraseña'
      assert_tag :tag => 'input', :attributes => { :id => 'email' }
    end

    def sends_mistaken_email(email)
      post_email(email)
      assert_response :success
      assert_template 'password_reset/new'
      assert_tag :tag => 'h1', :content => 'He olvidado mi Contraseña'
      assert_equal flash[:notice], 'No hemos encontrado ningún usuario con esa dirección de correo electrónico.'
      assert_tag :tag => 'div', :attributes => { :id => 'notice' },
                 :content => 'No hemos encontrado ningún usuario con esa dirección de correo electrónico.'
    end

    def sends_correct_email(email)
      post_email(email)
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'user_session/new'
      assert_tag :tag => 'h1', :content => 'Iniciar sesión'
      assert_equal flash[:notice], 'Le hemos enviado instrucciones para reestablecer su contraseña. Por favor, compruebe su correo electrónico.'
      assert_tag :tag => 'div', :attributes => { :id => 'notice' }, :content => 'Le hemos enviado instrucciones para reestablecer su contraseña. Por favor, compruebe su correo electrónico.'
      assert_tag :tag => 'input', :attributes => { :id => 'user_session_login' }
    end

    def resets_mismatched_password(parameters)
      user = User.find_by_id(parameters[:user][:id])
      edit_password_reset_url = url_for :controller => 'password_reset', :action => 'edit'
      edit_password_reset_url += "?id=#{user.perishable_token}"
      get edit_password_reset_url
      assert_response :success
      assert_template 'password_reset/edit'
      assert_tag :tag => 'h1', :content => 'Editar Contraseña'
      assert_tag :tag => 'input', :attributes => { :id => 'user_password' }
      assert_tag :tag => 'input', :attributes => { :id => 'user_password_confirmation' }
      post '/password_reset/update', parameters
      assert_response :success
      assert_template 'password_reset/edit'
      assert_tag :tag => 'h1', :content => 'Editar Contraseña'
      assert_tag :tag => 'h2', :content => '1 error al crear la cuenta:'
      assert_tag :tag => 'li', :content => 'Password doesn&#x27;t match confirmation'
      assert_tag :tag => 'div', :attributes => { :class => 'field_with_errors' }
      assert_tag :tag => 'input', :attributes => { :id => 'user_password' }
    end

    def resets_correct_password(parameters)
      user = User.find_by_id(parameters[:user][:id])
      edit_password_reset_url = url_for :controller => 'password_reset', :action => 'edit'
      edit_password_reset_url += "?id=#{user.perishable_token}"
      get edit_password_reset_url
      assert_response :success
      assert_template 'password_reset/edit'
      assert_tag :tag => 'h1', :content => 'Editar Contraseña'
      assert_tag :tag => 'input', :attributes => { :id => 'user_password' }
      assert_tag :tag => 'input', :attributes => { :id => 'user_password_confirmation' }
      post '/password_reset/update', parameters
      assert_response :redirect
      follow_redirect!
      assert_response :success
      assert_template 'user/show'
      assert_tag :tag => 'h1', :content => "#{user.login}"
      assert_equal flash[:notice], 'La contraseña ha sido actualizada con éxito. El usuario se ha conectado.'
      assert_tag :tag => 'div', :attributes => { :id => 'notice' },
                                :content => 'La contraseña ha sido actualizada con éxito. El usuario se ha conectado.'
      assert_tag :tag => 'dt', :content => 'Usuario'
      assert_tag :tag => 'dd', :content => user.login
    end

    private
    def post_email(email)
      post '/password_reset/create', email
    end
  end

  def new_session_as(name)
    open_session do |session|
      session.extend(BrowsingTestDSL)
      session.name = name
      yield session if block_given?
    end
  end
end
