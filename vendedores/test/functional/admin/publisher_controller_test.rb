require File.dirname(__FILE__) + '/../../test_helper'  
require 'admin/publisher_controller'

# Re-raise errors caught by the controller.   
class Admin::PublisherController; def rescue_action(e) raise e end; end  

class PublishersControllerTest < ActionController::TestCase
  fixtures :publishers

  setup do
    @controller = Admin::PublisherController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_publishers = Publisher.count
    post :create, :publisher => { :name => 'The Monopoly Publishing Company' }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal num_publishers + 1, Publisher.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => { :name => 'publisher[name]', :value => 'Apress' }
  end


  test "update" do
    post :update, :id => 1, :publisher => { :name => 'Apress.com' }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'Apress.com', Publisher.find(1).name
  end

  
  test "destroy" do
    assert_difference(Publisher, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'El editor Apress ha sido borrado.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'El editor Apress ha sido borrado.'
    end
  end


  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'admin/publisher/show'
    assert_not_nil assigns(:publisher)
    assert assigns(:publisher).valid?
    assert_tag "h1", :content => Publisher.find(1).name
  end


  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table', :children => { :count => Publisher.count + 1, :only => {:tag => 'tr'} }
    Publisher.find(:all).each do |a|
      assert_tag :tag => 'td', :content => a.name
    end
  end

  
end

