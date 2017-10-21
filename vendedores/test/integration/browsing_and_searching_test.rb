require File.dirname(__FILE__) + '/../test_helper'

class BrowsingAndSearchingTest < ActionDispatch::IntegrationTest
  fixtures :publishers, :authors, :books, :authors_books

  test "browse" do
    jill = new_session_as :jill
    jill.index
    jill.second_page
    jill.book_details "Pride and Prejudice"
    jill.search_jeremy
    jill.latest_books
    jill.read_rss
  end

  module BrowsingTestDSL
    include ERB::Util
    attr_writer :name

    def index
      get 'catalog/index'
      assert_response :success
      assert_tag :tag => 'dl', :attributes => { :id => 'books' },
                 :children => { :count => 5, :only => { :tag => 'dt' }}
      assert_tag :tag => 'dt', :content => 'The Idiot'
      check_book_links
    end

    def second_page
      get 'catalog/index?page=2'
      assert_response :success
      assert_template 'catalog/index'
      assert_equal Book.find_by_title('Pro Rails E-Commerce'),
                   assigns(:books).last
      check_book_links
    end
  end

  def book_details(title)
    @book = Book.find_by_title(title)
    get "catalog/show/#{@book.id}"
    assert_response :success
    assert_template 'catalog/show'
    assert_tag :tag => 'h1', :content => @book.title
    assert_tag :tag => 'h2', :content => "de #{@book.authors.map{|a| a.name}.join(", ")}"
  end

  def check_book_links
    for book in assigns :books
      assert_tag :tag => 'a', :attributes => { :href => "/catalog/show/#{book.id}" }
    end
  end

  def search_jeremy
    jeremy = Author.find_by_first_name_and_last_name('Jeremy', 'Keith')
    get "catalog/search?search_arg=#{url_encode('Jeremy Keith')}&commit=#{url_encode('By authors')}"
    assert_response :success
    assert_template 'catalog/search'
    assert_tag :tag => 'dl', :attributes => { :id => 'books' },
               :children => { :count => jeremy.books.size, :only => { :tag => 'dt' } }
    jeremy.books.each do |a|
      assert_tag :tag => 'dt', :content => a.title
    end
  end

  def latest_books
    get 'catalog/latest'
    assert_response :success
    assert_template 'catalog/latest'
    assert_tag :tag => 'dl', :attributes => { :id => 'books' },
               :children => { :count => 5, :only => { :tag => 'dt' } }
    @books = Book.latest(5)
    @books.each do |a|
      assert_tag :tag => 'dt', :content => a.title
    end
  end

    def read_rss
    get 'catalog/rss'
    assert_response :success
    assert_template 'catalog/rss'
    assert_match "application/xml", response.headers["Content-Type"]
    assert_tag :tag => 'channel', :children => { :count => 5, :only => { :tag => 'item' } }
    @books = Book.latest(5)
    @books.each do |a|
      assert_tag :tag => 'title', :content => a.title
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


