# encoding: utf-8  
require File.dirname(__FILE__) + '/../../test_helper'  
require 'admin/author_controller'  

# Re-raise errors caught by the controller.   
class Admin::AuthorController; def rescue_action(e) raise e end; end  

class Admin::AuthorControllerTest < ActionController::TestCase
  fixtures :authors  

  def setup   
    @controller = Admin::AuthorController.new  
    @request = ActionController::TestRequest.new  
    @response = ActionController::TestResponse.new  
  end  

  def test_new
    get :new  
    assert_template 'admin/author/new'  
    assert_tag 'h1', :content => 'Crear nuevo autor'  
    assert_tag 'form', :attributes => {:action => '/admin/author/create'}   
  end  

  def test_create
    get :new    
    assert_template 'admin/author/new'
    assert_difference(Author, :count) do
      post :create, :author => {:first_name => 'Joel', :last_name => 'Spolsky'}
      assert_response :redirect
      assert_redirected_to :action => 'index'      
    end
    assert_equal 'El autor Joel Spolsky ha sido creado.', flash[:notice]
  end

  def test_failing_create
    assert_no_difference(Author, :count) do
      post :create, :author => {:first_name => 'Joel'}
      assert_response :success
      assert_template 'admin/author/new'
      assert_tag :tag => 'div', :attributes => {:class => 'field_with_errors'}
    end
  end

  def test_edit
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => { :name => 'author[first_name]', :value => 'Joel' }
    assert_tag :tag => 'input', :attributes => { :name => 'author[last_name]', :value => 'Spolsky' }
  end

  def test_update
    post :update, :id => 1, :author => { :first_name => 'Joseph', :last_name => 'Spolsky' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Joseph', Author.find(1).first_name
  end

  def test_destroy
    assert_difference(Author, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'El autor Joel Spolsky ha sido borrado.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
        :content => 'El autor Joel Spolsky ha sido borrado.'
    end
  end

  def test_show
    get :show, :id => 1
    assert_template 'admin/author/show'
    assert_equal 'Joel', assigns(:author).first_name
    assert_equal 'Spolsky', assigns(:author).last_name
  end

  def test_index
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Author.count + 1, :only => {:tag => 'tr'} }
    Author.find(:all).each do |a|
      assert_tag :tag => 'td', :content => a.name
    end
  end
end