require File.dirname(__FILE__) + '/../test_helper'

class AuthenticationTest < ActionDispatch::IntegrationTest

  def setup
    #Creamos el usuario george (administrador) para usarlo en el test
    User.create(:name => 'George Smith', :login => 'george', :email => 'george@emporium.com',
                :password => 'cheetah', :password_confirmation => 'cheetah')
  end

  test "successful_login" do
    george = new_session_as(:george)
    # Se redirige a George a las páginas de administrador  
    george.tries_to_go_to_admin
    george.logs_in_succesfully("george", "cheetah")
  end

  test "failed_login" do
    harry = new_session_as(:harry)
    # Se redirige a Harry a las páginas de administrador  
    harry.tries_to_go_to_admin
    harry.fails_login("harry", "micky")
  end

  private

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def tries_to_go_to_admin
      # George intenta acceder a una zona para administrador
      get '/admin/book/new'
      # Se redirige a la página de "iniciar sesión"
      assert_response :redirect
      assert_redirected_to '/user_session/new'
    end

    def logs_in_succesfully(login, password)
      # Ejecuta el método post_login para iniciar sesión
      post_login(login, password)
      # Redirige al usaurio ya conectado a la página de administrador de book
      assert_response :redirect
      assert_redirected_to '/admin/book/new'
    end

    def fails_login(login, password)
      # Ejecuta el método post_login para iniciar sesión
      post_login(login, password)
      assert_response :success
      assert_template 'user_session/new'
      assert_tag :tag => 'div', :attributes => { :id => 'errorExplanation' }
      assert_tag :tag => 'li', :content => 'Login is not valid'
    end

    private

    def post_login(login, password)
      # Inicia sesión desde la página de inicio de sesión
      post '/user_session/create', :user_session => { :login => login, :password => password }
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
