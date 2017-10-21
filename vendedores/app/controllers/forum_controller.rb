# encoding: utf-8
class ForumController < ApplicationController
  before_filter :require_user, :only => :destroy

  def post
    @post = ForumPost.new
    @page_title = 'Enviar Mensaje a Temas de discusión'
  end

  def create
    @post = ForumPost.new(params[:post])
    if @post.save
      flash[:notice] = 'El mensaje fué creado con éxito.'
      redirect_to :action => 'index'
    else
      if @post.parent_id == 0
         @page_title = 'Enviar Mensaje a Temas de Discusión'
      else
	 @page_title = "Responder al Mensaje '#{ForumPost.find(@post.parent_id).subject}'"
      end
      render :action => 'post'
    end
  end


  def reply
    reply_to = ForumPost.find(params[:id])
    @post = ForumPost.new(:parent_id => reply_to.id)
    @page_title = "Responder al Mensaje '#{reply_to.subject}'"
    render :action => 'post'
  end

  def destroy  
    # Solo se puede borrar los Post root, para que no se queden post huérfanos
    @post = ForumPost.find(params[:id])
    @posts = ForumPost.find_all_by_root_id(@post.root_id)
    @posts.each do |post|
      post.destroy
    end
    flash[:notice] = "El mensaje '#{@post.subject}' ha sido borrado."
    redirect_to :action => 'index'
   
  end

  def show
    @post = ForumPost.find(params[:id])
    @page_title = "'#{@post.subject}'"
  end

  def index
    @posts = ForumPost.paginate :page => params[:page], :order => 'root_id desc, lft', :per_page => 10
    @page_title = 'Temas de discusión'
  end
end

