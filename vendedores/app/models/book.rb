# encoding: utf-8
class Book < ActiveRecord::Base
  
  attr_accessible :title, :publisher_id, :publisher, :published_at, :blurb, :isbn, :page_count, :price, :author_ids, :authors, :cover_image, :tag_ids

  has_and_belongs_to_many :authors
  belongs_to :publisher

  has_attached_file :cover_image
  # Para los tags
  acts_as_taggable
  
  #Relaciona el modelo Book con Cart y CartItem
  has_many :cart_items
  has_many :carts, :through => :cart_items 
  
  
  validates_length_of :title, :in => 1..255, :message => '- El título debe ser mínimo 1 carácter y máximo 255'
  validates_presence_of :publisher, :message => '- El campo Editor no puede ser blanco' 
  validates_presence_of :authors, :message => '- El campo Autores no puede ser blanco'
  validates_presence_of :published_at, :message => '- El campo Fecha de Publicación no puede ser blanco'
  validates_numericality_of :page_count, :only_integer => true, :message => '- Número de Páginas debe contener un valor numérico entero' 
  validates_numericality_of :price, :message => '- Precio debe contener un valor numérico' 
  validates_format_of :isbn, :with => /[0-9\-xX]{13}/, :message => '- Formato inválido' 
  validates_uniqueness_of :isbn, :message => '- El campo ISBN no puede ser blanco' 

  def author_names
    self.authors.map{|author|author.name}.join(" , ")
  
  end
  
  
  def related_tags
    book_related_tags = []
    for related_book in self.find_related_tags
      book_related_tags += related_book.tags
    end
    (book_related_tags -= self.tags).uniq
  end

  
  
  def self.latest(num)
    find :all, :limit => num, :order => "books.id desc", :include => [:authors, :publisher]
  end
  
end
