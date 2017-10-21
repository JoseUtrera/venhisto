class Admin::BookController < Admin::AuthenticatedController
 
  def new
    load_data
    @book = Book.new
    @page_title = 'Crear libro'
  end

  

  def create
    @book = Book.new(params[:book])
    @book.tag_list = params[:tags]
    if @book.save
      flash[:notice] = "El libro #{@book.title} ha sido creado."
      redirect_to :action => 'index'
    else
      load_data
      @page_title = 'Crear libro'
      render :action => 'new'
    end
  end


  def edit
    load_data
    @book = Book.find(params[:id])
    @page_title = 'Editar Libro'
  end

  def update
    @book = Book.find(params[:id])
    @book.tag_list = params[:tags]
    if @book.update_attributes(params[:book])
      flash[:notice] = "El libro #{@book.title} ha sido actualizado."
      redirect_to :action => 'show', :id => @book
    else
      load_data
      @page_title = 'Editar Libro'
      render :action => 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    flash[:notice] = "El libro #{@book.title} ha sido borrado."
    redirect_to :action => 'index'
  end

  def show
    @book = Book.find(params[:id])
    @page_title = @book.title
  end

  def index
    sort_by = params[:sort_by]
    @books = Book.paginate :page => params[:page], :order => sort_by, :per_page => 5
    @page_title = 'Listado de libros'
  end

private

  
  def load_data
    @authors    = Author.find(:all)
    @publishers = Publisher.find(:all)
    @tags = Tag.find(:all)
  end
  
end


