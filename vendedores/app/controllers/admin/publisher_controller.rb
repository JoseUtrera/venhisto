class Admin::PublisherController < Admin::AuthenticatedController
  
  def new
    @publisher = Publisher.new
    @page_title = 'Crear nuevo Editor'
  end

  def create
    @publisher = Publisher.new(params[:publisher])
    if @publisher.save
      flash[:notice] = "El editor #{@publisher.name} ha sido creado."
      redirect_to :action => 'index'
    else
      @page_title = 'Crear nuevo Editor'
      render :action => 'new'
    end
  end

  def edit
    @publisher = Publisher.find(params[:id])
    @page_title = 'Editar Editor'
  end

  def update
    @publisher = Publisher.find(params[:id])
    if @publisher.update_attributes(params[:publisher])
       flash[:notice] = "El editor #{@publisher.name} ha sido actualizado."
       redirect_to :action => 'show', :id => @publisher
    else
       @page_title = 'Editar Editor'
       render :action => 'edit'
    end
  end


  def destroy
    @publisher = Publisher.find(params[:id])
    @publisher.destroy
    flash[:notice] = "El editor #{@publisher.name} ha sido borrado."
    redirect_to :action => 'index'
  end


  def show
    @publisher = Publisher.find(params[:id])
    @page_title = @publisher.name
  end

  def index
    @publishers = Publisher.all
    @page_title = 'Listado de Editores'
  end

end
