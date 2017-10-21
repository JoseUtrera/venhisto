 

class Admin::AuthorController < Admin::AuthenticatedController
  def new
    @author = Author.new
    @page_title = 'Crear nuevo autor'
  end

  def create
    @author = Author.new(params[:author])
    if @author.save
      flash[:notice] = "El autor #{@author.name} ha sido creado."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear nuevo autor'
      render :action => 'new'
    end
  end

  def edit
    @author = Author.find(params[:id])
    @page_title = 'Editar autor'
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(params[:author])
      flash[:notice] = "El autor #{@author.name} ha sido actualizado."
      redirect_to :action => 'show', :id => @author
    else
      @page_title = 'Editar autor'
      render :action => 'edit'
    end
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
    flash[:notice] = "El autor #{@author.name} ha sido borrado."
    redirect_to :action => 'index'
  end

  def show
    @author = Author.find(params[:id])
    @page_title = @author.name
  end

  def index
    @authors = Author.find(:all)
    @page_title = 'Listado de autores'
  end
end