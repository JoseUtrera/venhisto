require File.dirname(__FILE__) + '/../../test_helper'  
require 'admin/book_controller'

# Re-raise errors caught by the controller.   
class Admin::BookController; def rescue_action(e) raise e end; end  

class BookControllerTest < ActionController::TestCase
  fixtures :authors, :publishers, :books

  setup do
    @controller = Admin::BookController.new
    @request = ActionController::TestRequest.new
    @response = ActionController::TestResponse.new
  end

  test "new" do
    get :new
    assert_response :success
  end

  test "create" do
    num_books = Book.count
    post :create, :book => { :title => 'Ruby on Rails', :publisher_id => Publisher.find(1).id,
         :published_at => Time.now, :isbn => '123-123-123-1', :author_ids => Author.find(:all),
         :blurb => 'A great book', :page_count => 375, :price => 45.5 }
    assert_response :redirect
    assert_redirected_to :action => 'index'
    assert_equal num_books + 1, Book.count
  end

  test "edit" do
    get :edit, :id => 1
    assert_tag :tag => 'input', :attributes => { :name => 'book[title]',
               :value => 'Pro Rails E-Commerce' }
  end

  test "update" do
    post :update, :id => 1, :book => { :title => 'The book of Ruby',
         :publisher_id => Publisher.find(1).id, :published_at => Time.now,
         :isbn => '123-123-123-1', :author_ids => Author.find(:all), :blurb => 'A great book',
         :page_count => 375, :price => 45.5 }
    assert_response :redirect
    assert_redirected_to :action => 'show', :id => 1
    assert_equal 'The book of Ruby', Book.find(1).title
  end

  test "destroy" do
    assert_difference(Book, :count, -1) do
      post :destroy, :id => 1
      assert_equal flash[:notice], 'El libro Pro Rails E-Commerce ha sido borrado.'
      assert_response :redirect
      assert_redirected_to :action => 'index'
      get :index
      assert_response :success
      assert_tag :tag => 'div', :attributes => {:id => 'notice'},
                 :content => 'El libro Pro Rails E-Commerce ha sido borrado.'
    end
  end

  test "show" do
    get :show, :id => 2
    assert_response :success
    assert_template 'admin/book/show'
    assert_equal 'Pro Rails E-Commerce 2nd Edition', assigns(:book).title
    assert_equal '199-199-199-2', assigns(:book).isbn
    assert_tag "h1", :content => Book.find(2).title
  end

  test "index" do
    get :index
    assert_response :success
    assert_tag :tag => 'table'
    @books = Book.find(:all)
    pages = @books.count / 5
    pages += 1 unless @books.count % 5 == 0
    page = 1
    cont = 1
    @books.each do |a|
      assert_tag :tag => 'td', :content => a.title
      cont = cont + 1
      if cont > 5 && page < pages  # go to next page
        page = page + 1
        cont = 1
        get :index, :page => page
        assert_response :success
      end
    end
  end
end

