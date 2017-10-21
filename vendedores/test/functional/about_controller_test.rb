# encoding: UTF-8

require File.dirname(__FILE__) + '/../test_helper'

class AboutControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_template 'about/index'
    assert_equal 'Acerca de Vendedores de Historias', assigns(:page_title)
    assert_tag 'title', :content => 'Acerca de Vendedores de Historias'
  end

end
