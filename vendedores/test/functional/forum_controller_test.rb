# encoding: UTF-8
require File.dirname(__FILE__) + '/../test_helper'  
require 'forum_controller'

# Re-raise errors caught by the controller.   
class ForumController; def rescue_action(e) raise e end; end
  
class ForumControllerTest < ActionController::TestCase
  fixtures :forum_posts

  def setup   
    @controller = ForumController.new  
    @request = ActionController::TestRequest.new  
    @response = ActionController::TestResponse.new  
  end

  test "post" do
    get :post
    assert_template 'forum/post'
    assert_tag 'h1', :content => 'Enviar Mensaje a Temas de discusión'
    assert_tag 'form', :attributes => { :action => '/forum/create' }
  end

  test "create" do
    get :post
    assert_template 'forum/post'
    assert_difference(ForumPost, :count) do
      post :create, :post => {:name => 'Andy', :subject => 'Subject', :body => 'Body text' }
      assert_response :redirect
      assert_redirected_to :action => 'index'      
    end
    assert_equal 'El mensaje fué creado con éxito.', flash[:notice]
  end

  test "reply" do
    get :reply, :id => 1
    assert_response :success
    assert_template 'forum/post'
    reply_to = ForumPost.find(1)
    assert_tag "h1", :content => "Responder al Mensaje &#x27;" + reply_to.subject + '&#x27;'
    assert_tag 'form', :attributes => { :action => '/forum/create' }
  end

  test "destroy" do
    post_root = ForumPost.find(1)
    posts = ForumPost.find_all_by_root_id(post_root.root_id)
    assert_difference(ForumPost, :count, -posts.size) do
      post :destroy, :id => 1
      assert_equal flash[:notice], "El mensaje '#{post_root.subject}' ha sido borrado."
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => { :id => 'notice' },
                 :content => "El mensaje &#x27;#{post_root.subject}&#x27; ha sido borrado."
    end
  end

  test "show" do
    get :show, :id => 1
    assert_response :success
    assert_template 'forum/show'
    assert_equal 'George', assigns(:post).name
    assert_equal 'Emporium downtime', assigns(:post).subject
    assert_equal 'Emporium downtime', assigns(:post).body
    assert_tag "h1", :content => '&#x27;' + ForumPost.find(1).subject + '&#x27;'
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'a', :content => 'Nuevo Mensaje'
    @posts = ForumPost.find(:all)
    pages = @posts.count / 10
    pages += 1 unless @posts.count % 10 == 0
    page = 1
    cont = 1
    @posts.each do |post|
      assert_tag :tag => 'a', :content => post.subject
      cont = cont + 1
      if cont > 10 && page < pages  # go to next page
        page = page + 1
        cont = 1
        get :index, :page => page
        assert_response :success
      end
    end
  end
end
