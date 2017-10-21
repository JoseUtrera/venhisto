# encoding: UTF-8

class User < ActiveRecord::Base
  
  acts_as_authentic do |a|
    a.validate_login_field = true
    a.validate_password_field = true
    a.require_password_confirmation = true
    a.logged_in_timeout = 10.minutes # default is 10.minutes
  end

  attr_accessible :name, :login, :email, :password, :password_confirmation
  
  # Validaciones para Password
  validates_presence_of :password, :message => '- El campo Clave no puede ser blanco' 
  validates_presence_of :password_confirmation, :message => '- El campo Confirmar Clave no puede ser blanco' 
  
  #Validaciones para Login
  validates_presence_of :login, :message => '- Usuario no puede ser blanco' 
  validates_uniqueness_of :login, :message => '- Usuario debe ser único'
  
  # Validaciones para Email
  validates_presence_of :email, :message => '- Email no puede ser blanco'
  validates_uniqueness_of :email, :message => '- Email debe ser único'

  # Validaciones Nombre y Apellidos  
  validates_uniqueness_of :name, :message => '- Nombre y Apellidos debe ser único'
  validates_presence_of :name, :message => '- Nombre y Apellidos no puede ser blanco' 
  validates_length_of :name, :in => 3..225, :message => '- Nombre y Apellidos debe ser mínimo 3 caracteres y máximo 255'
  
end
