# encoding: utf-8  

require File.dirname(__FILE__) + '/../test_helper'  
require 'catalog_controller'


class CatalogController; def rescue_action(e) raise e end; end
  
class CatalogControllerTest < ActionController::TestCase
fixtures :authors, :publishers, :books, :authors_books
  
  setup do
      @controller = CatalogController.new
      @request = ActionController::TestRequest.new
      @response = ActionController::TestResponse.new
  end 

  test "show" do
    get :show, :id => 2
    assert_response :success
    assert_template 'catalog/show'
    assert_equal 'Pro Rails E-Commerce 2nd Edition', assigns(:book).title
    assert_equal '199-199-199-2', assigns(:book).isbn
    assert_tag 'h1', :content => Book.find(2).title
  end

     test "index" do
    get :index
    assert_response :success
    assert_tag 'h1', :content => 'Catálogo'.force_encoding("UTF-8")
    assert_tag 'p', :content => '5 últimos'
    @books = Book.find :all, :order => "books.id desc"
    pages = @books.count / 5
    pages += 1 unless @books.count % 5 == 0
    cont = 1
    page = 1
    @books.each do |a|
      assert_tag :tag => 'dt', :content => a.title
      cont = cont + 1
      if cont > 5 && page < pages  # go to next page
        page = page + 1
        cont = 1
        get :index, :page => page
        assert_response :success
      end
    end
  end



  test "latest" do
    get :latest
    assert_response :success
    assert_tag 'h1', :content => '5 últimos'
    @books = Book.latest 5
    @books.each do |a|
      assert_tag :tag => 'dt', :content => a.title
    end
  end
  
  test "search" do
    get :search, :search_arg => 'Commerce', :commit => 'Por título'
    assert_response :success
    assert_tag 'h1', :content => 'Buscar Libro'
    assert_tag 'dt', :content => 'Pro Rails E-Commerce'
    assert_tag 'dt', :content => 'Pro Rails E-Commerce 2nd Edition'

    get :search, :search_arg => 'Framework', :commit => 'Por título'
    assert_response :success
    assert_tag 'h1', :content => 'Buscar Libro'
    assert_tag :tag => 'div', :attributes => { :id => 'notice' },
               :content => 'No se encuentran libros que concuerden con su criterio de búsqueda.'

    get :search, :search_arg => 'Joel Spolsky', :commit => 'Por autores'
    assert_response :success
    assert_tag 'h1', :content => 'Buscar Libro'
    assert_tag 'dt', :content => 'Pro Rails E-Commerce'

    get :search, :search_arg => 'Berlitz', :commit => 'Por autores'
    assert_response :success
    assert_tag 'h1', :content => 'Buscar Libro'
    assert_tag :tag => 'div', :attributes => { :id => 'notice' },
               :content => 'No se encuentran libros que concuerden con su criterio de búsqueda.'
  end
 
end

