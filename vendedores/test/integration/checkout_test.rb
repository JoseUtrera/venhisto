# encoding: UTF-8

require File.dirname(__FILE__) + '/../test_helper'

class CheckoutTest < ActionDispatch::IntegrationTest
 
  fixtures :publishers, :authors, :books
  
  test "empty_cart_shows_error_message" do
    #Chequea que no es posible realizar un ‘checkout’ cuando el carrito se encuentra vacío. Cuando se produce ese caso, no redirige la acción a ‘catalog’ y nuestra mensaje indicativo del error
    get '/checkout'
    assert_response :redirect
    assert_redirected_to :controller => 'catalog'
    assert_equal flash[:notice], '¡Su carrito se encuentra vacío! ' +
                                 'Por favor, añada al menos un libro antes de proceder a realizar el pedido.'
  end

  test "submitting_order" do
    # Gracias a los fixtures se añade el libro con id=1 al carrito mediante la acción add del controller cart
    post '/cart/add', :id => 1
    # Se accede a la pag checkout y se verifica el acceso correcto
    get '/checkout'
    assert_response :success
   
        # Chequea que la página contiene 3 secciones: 'Informacion de contacto', 'Direccion de envio'  y 'Informacion de Venta' ( Si no coincide el :content con la etiqueta del formulario en la vista, falla)
    assert_tag :tag => 'legend', :content => 'Información de contacto'
    assert_tag :tag => 'legend', :content => 'Dirección de envío'
    assert_tag :tag => 'legend', :content => 'Información de Venta'
    
     # Chequea el correcto envío de los datos de los formularios al hacer el pedido 
    
    post '/checkout/submit_order', :cart => { :id => Cart.last.id }, :order => {
      # Contact information
      :email => 'email@email.com',
      :phone_number => '666112233',
      # Shipping address
      :ship_to_first_name => 'Firstname',
      :ship_to_last_name => 'Lastname',
      :ship_to_address => 'Address',
      :ship_to_city => 'City',
      :ship_to_postal_code => '00000',
      :ship_to_country_code => 'Country',
      # Billing information
      :card_type => 'Visa',
      :card_number => 'xxxxxxxxx',
      :card_expiration_month => 'xxxx',
      :card_expiration_year => 'xxxxx',
      :card_verification_value => '000'
    }
 
    assert_response :redirect
    assert_redirected_to '/checkout/thank_you'

   end 
end