class Cart < ActiveRecord::Base
    
  #Contiene muchos items
  has_many :cart_items
  #Contiene muchos libros accesibles desde cart_items
  has_many :books, :through => :cart_items
 

  def add(book_id)
    # selecciona todos los items donde aparezca
    # el id del libro
    items = cart_items.find_all_by_book_id book_id
    book = Book.find book_id
 
    # si items.size < 1 es que no se ha añadido
    # este libro al carrito previamente por lo
    # que habrá que crear un registro en la 
    # tabla.
    if items.size < 1
      ci = cart_items.create :book_id => book_id, :amount => 1, :price => book.price
    else
      # implica que ya estaba en el carrito
      # sólo hay que aumentar la cantidad pedida
      ci = items.first
      ci.update_attribute :amount, ci.amount + 1
    end
    ci
  end

  
  def remove(book_id)
    ci = cart_items.find_by_book_id book_id 
    if ci.amount > 1
      ci.update_attribute :amount, ci.amount - 1
    else
      CartItem.destroy ci.id
    end
    ci
  end
  
  
  def total
    sum = 0
    cart_items.each do |item| sum += item.price * item.amount end
    sum
  end
  
  
end
