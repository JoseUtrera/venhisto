 
class Admin::TagController < ApplicationController
  before_filter :require_user, :except => :show

  def new
    @tag = Tag.new
    @page_title = 'Crear Palabra Clave'
  end

  def create
    @tag = Tag.new(params[:tag])
    if @tag.save
      flash[:notice] = "La Palabra Clave #{@tag.name} ha sido creada."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear Palabra Clave'
      render :action => 'new'
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    @page_title = 'Editar Palabra Clave'
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update_attributes(params[:tag])
      flash[:notice] = "La Palabra Clave #{@tag.name} ha sido actualizada."
      redirect_to :action => 'index'
    else
      @page_title = 'Editar Palabra Clave'
      render :action => 'edit'
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Se ha borrado la Palabra Clave #{@tag.name}."
    redirect_to :action => 'index'
  end

  def show
    @tag = Tag.find(params[:id])
    @books = Book.tagged_with([@tag.name], :any => true).sort{ |a, b| a.title <=> b.title }
    if @books.count > 0
      @page_title = "Libros con la Palabra Clave '#{@tag.name}'"
    else
      @page_title = "No hay libros con la Palabra Clave '#{@tag.name}'"
    end
  end

  def index
    @tags = Tag.paginate :page => params[:page], :order => 'name', :per_page => 10
    @page_title = 'Listado de Palabras Clave'
  end
end
