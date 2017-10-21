# encoding: utf-8

class CatalogController < ApplicationController
 
  #Ejecuta el método initialize_cart de la clase superior applicationController
  before_filter :initialize_cart, :except => [:show, :latest]  
  
  def index
    @books = Book.paginate :page => params[:page], :order => "books.id desc", :per_page => 5,
                           :include => [:authors, :publisher]
    @page_title = 'Catálogo'
  end


  def show
    @book = Book.find(params[:id])
    # add '.sort{ |a, b| a.title <=> b.title }' to '@book.find_related_tags' for an ordered book list
    @book_tagged_related = @book.find_related_tags
    # method 'related_tags' defined in 'Book' active record
    @book_related_tags = @book.related_tags.sort{ |a,b| a.name <=> b.name }
    @page_title = @book.title
  end


   def search
     # Detecta que haya algún parámetro de búsqueda
    if params[:search_arg] && !params[:search_arg].empty?
      str = params[:search_arg].to_s.upcase
      if params[:commit] == 'Por título'
        @search = Book.search :title_contains => str
      else # params[:commit] == 'Por autores'
        if str.count(' ') == 0
          @search = Book.search :authors_first_name_or_authors_last_name_contains => str
        else
          @search = Book.search :authors_first_name_contains => str.split(' ')[0],
                                :authors_last_name_contains => str.split(' ')[1]
        end
      end
      @books = @search.all
      flash.now[:notice] = 'No se encuentran libros que concuerden con su criterio de búsqueda.' unless @books.size > 0
    end
    @page_title = 'Buscar Libro'
  end

  
  def latest
  
    #LLama al método 'latest' para obtener los últimos 5 libros
    @books = Book.latest 5
    @page_title = '5 últimos'
  end
  
  def rss
    latest
    render :layout => false
    response.headers["Content-Type"] = "application/xml; version=1.0; charset=utf-8"
  end
  
end
