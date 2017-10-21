# encoding: utf-8

class Order < ActiveRecord::Base
  
  attr_protected :id, :customer_ip, :status, :error_message, :created_at, :updated_at
  
  attr_accessor :card_type, :card_number, :card_expiration_month, :card_expiration_year, :card_verification_value
  
  has_many :order_items
  has_many :books, :through => :order_items


  validates_presence_of :order_items,
                        :message => '¡Su carrito está vacío! ' +
                                    'Por favor, añada al menos un libro antes de lanzar la orden.'
  
  validates_length_of :ship_to_first_name, :in => 2..255, :message => '- El nombre debe ser mínimo de 2 caracteres y máximo 255'
  validates_length_of :ship_to_last_name, :in => 2..255, :message => '- Los apellidos deben ser mínimo de 2 caracteres y máximo 255'
  validates_length_of :ship_to_address, :in => 2..255, :message => '- La dirección debe ser mínimo de 2 caracteres y máximo 255'
  validates_length_of :ship_to_city, :in => 2..255, :message => '- La ciudad debe ser mínimo de 2 caracteres y máximo 255'
  validates_length_of :ship_to_postal_code, :in => 2..255, :message => '- El código Postal debe ser mínimo de 2 caracteres y máximo 255'
  validates_length_of :ship_to_country_code, :in => 2..255, :message => '- El país debe ser mínimo de 2 caracteres y máximo 255'
  
  
  validates_format_of :email, :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => '- El formato del correo no es válido'
  
  validates_length_of :phone_number, :in => 7..20, :message => '- El número de teléfono debe ser mínimo de 7 caracteres y máximo 20'
  
  validates_length_of :customer_ip, :in => 7..15, :message => '- La dirección IP debe ser mínimo de 7 caracteres y máximo 15'
  
  validates_inclusion_of :status, :in => %w(abierto procesado cerrado error), :message => '- Los valores permitidos para Estado son: Abierto/Procesado/Cerrado/Error '
  
 validates_inclusion_of :card_type, :in => ['Visa', 'MasterCard', 'American Express', 'Discover'], :on => :create, :message => '- Los valores permitidos para Tipo de Tarjeta son: Visa/MasterCard/American Express/Discover '
  
 
  validates_length_of :card_number, :in => 13..19, :on => :create, :message => '- El Número de Tarjeta debe ser mínimo de 13 caracteres y máximo 19'
  
  validates_inclusion_of :card_expiration_month, :in => %w(1 2 3 4 5 6 7 8 9 10 11 12), :on => :create, :message => '- El mes para la Fecha de Expiración no es válido'
  
  validates_inclusion_of :card_expiration_year, :in => %w(2013 2014 2015 2016 2017 2018 2019 2020 2021 2022 2023), :on => :create, :message => '- El año para la Fecha de Expiración no es válido'
  
  validates_length_of :card_verification_value, :in => 3..4, :on => :create, :message => '- El CVV/CVC debe ser mínimo de 3 caracteres y máximo 4'

  def total
    sum = 0
    order_items.each do |item|
      sum += item.price * item.amount
    end
    sum
  end  
  
  
  def process
    begin
      raise 'Una orden cerrada no puede procesarse de nuevo' if self.closed?
      active_merchant_payment
    rescue => e
      logger.error("La orden #{id} ha fallado por: #{e}.")
      self.error_message = "Mensaje de error #{e}"
      self.status = 'error'
    end
    save!
    self.processed?
  end  
  

  def active_merchant_payment
    ActiveMerchant::Billing::Base.mode = :test
    # Se indica que es en pruebas
#    ActiveMerchant::Billing::AuthorizeNetGateway.default_currency = 'USD'
    ActiveMerchant::Billing::AuthorizeNetGateway.default_currency = 'EUR'
    ActiveMerchant::Billing::AuthorizeNetGateway.wiredump_device = STDERR   
    ActiveMerchant::Billing::AuthorizeNetGateway.wiredump_device.sync = true
    self.status = 'error' # Por defecto le damos el estado "error"

    # the card verification value is also known as CVV2, CVC2, or CID
    creditcard = ActiveMerchant::Billing::CreditCard.new(
      :brand              => card_type,
      :number             => card_number,
      :month              => card_expiration_month,
      :year               => card_expiration_year,
      :verification_value => card_verification_value,
      :first_name         => ship_to_first_name,
      :last_name          => ship_to_last_name
    )

    # buyer information
    shipping_address = {
      :first_name => ship_to_first_name,
      :last_name  => ship_to_last_name,
      :address1   => ship_to_address,
      :city       => ship_to_city,
      :zip        => ship_to_postal_code,
      :country    => ship_to_country_code,
      :phone      => phone_number
    }

    # order information
    details = {
      :description      => 'Librería vendedores de historias',
      :order_id         => self.id,
      :email            => email,
      :ip               => customer_ip,
      :billing_address  => shipping_address,
      :shipping_address => shipping_address
    }

    if creditcard.valid? # validating the card automatically detects the card type
      gateway = ActiveMerchant::Billing::AuthorizeNetGateway.new( # usa mi cuenta de pruebas
        :login     => '43W2Q6Mwkt',
        :password  => '3BgF749dN875qrPm'
       # the statement ":test = 'true'" tells the gateway to not to process transactions
      )
      
      # Active Merchant accepts all amounts as integer values in cents
      response = gateway.purchase(self.total * 100, creditcard, details)
      
      if response.success?
        self.status = 'procesado'
      else
        self.error_message = response.message
      end
    else
      self.error_message = 'Tarjeta de crédito no válida'
    end
  end

  

  
  def processed?
    self.status == 'procesado'
  end

  def failed?
    self.status == 'error'
  end

  def closed?
    self.status == 'cerrado'
  end

  def close
    self.status = 'cerrado'
    save!
  end

end
