require File.dirname(__FILE__) + '/../test_helper'

class BookTest < ActiveSupport::TestCase
  fixtures :authors, :publishers, :books, :authors_books  
 
  
  # Chequea la funcionalidad Tagging
  test "tagging" do
    # Leemos un libro del book fixture
    book = Book.find(1)
    # Le asignamos tags
    book.tag_list = "Ruby on Rails, E-Commerce"

    # Asignamos valores a los atributos no inicializados en el fixture 
    assert book.update_attributes(:author_ids => [3, 4], :blurb => 'A new Rails E-Commerce book',  
                                  :page_count => 375)
    book.reload # Recargamos el libro de la base de datos, equivalente a 'book = Book.find(1)'

    # Verificamos ahora que se ha guardado las marcas Tag   
    assert book.tag_list.include?("Ruby on Rails")
    assert book.tag_list.include?("E-Commerce")
    assert_equal book.tag_list, ['Ruby on Rails', 'E-Commerce']
    assert_equal 2, book.tags.size

    assert_equal 1, Book.tagged_with(['Ruby on Rails'], :any => true).size
    assert_equal 1, Book.tagged_with(['E-Commerce'], :any => true).size
  end

  
  # Chequea las validaciones del Modelo Book
  def test_failing_create
    book = Book.new
    assert_equal false, book.save
    assert_equal 7, book.errors.count
    assert book.errors[:title]
    assert book.errors[:publisher]
    assert book.errors[:authors]
    assert book.errors[:published_at]
    assert book.errors[:isbn]
    assert book.errors[:blurb]
    assert book.errors[:page_count]
    assert book.errors[:price]
  end

  
  # Testea que un libro válido puede grabarse en la bd
  def test_create
    book = Book.new(
      :title => 'Ruby on Rails',
      :authors => Author.find(:all),
      :publisher_id => Publisher.find(1).id,
      :published_at => Time.now,
      :isbn => '123-123-123-1',
      :blurb => 'Un gran libro',
      :page_count => 375,
      :price => 45.5
    )
    assert book.save
  end

  
  # Testea que podemos acceder a una collección de libros
  # desde un publisher
  def test_has_many_and_belongs_to_mapping
    apress = Publisher.find_by_name("Apress");
    count = apress.books.count
    book = Book.new(
      :title => 'Pro Rails E-Commerce 8th Edition',
      :authors => [Author.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Author.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :publisher_id => apress.id,
      :published_at => Time.now,
      :isbn => '123-123-123-x',
      :blurb => 'E-Commerce on Rails',
      :page_count => 400,
      :price => 55.5
    )
    apress.books << book
    apress.reload
    book.reload
    assert_equal count + 1, apress.books.count
    assert_equal 'Apress', book.publisher.name
  end

  # Verifica la relación muchos a muchos.
  def test_has_many_and_belongs_to_many_authors_mapping
    book = Book.new(
      :title => 'Pro Rails E-Commerce 8th Edition',
      :authors => [Author.find_by_first_name_and_last_name('Joel', 'Spolsky'),
                   Author.find_by_first_name_and_last_name('Jeremy', 'Keith')],
      :publisher_id => Publisher.find_by_name("Apress").id,
      :published_at => Time.now,
      :isbn => '123-123-123-x',
      :blurb => 'E-Commerce on Rails',
      :page_count => 400,
      :price => 55.5
    )
    assert book.save
    book.reload
    # Verifica que podemos acceder al número de autores que han escrito un libro
    assert_equal 2, book.authors.count
    # Verifica que podemos acceder al número de libros escrito por un autor
    assert_equal 2, Author.find_by_first_name_and_last_name('Joel', 'Spolsky').books.count
  end

    test "meta_search" do
    assert Book.search :title_contains => 'Pride and Prejudice'

    assert_difference Book, :count do
      book = Book.new :title => 'The magic of games', :published_at => Time.now,
                      :published_at => Time.now, :page_count => 275, :price => 55.5,
                      :isbn => '299-299-299-3'
      book.authors << Author.create(:first_name => "Skinny", :last_name => "Walrus")
      book.publisher = Publisher.find(2)
      assert book.valid?
      book.save

      assert_equal 1, Book.search(:title_contains => 'magic').count
      assert_equal 1, Book.search(:authors_first_name_contains => 'inn',
                                  :authors_last_name_contains => 'alr').count
    end
  end
  
end
