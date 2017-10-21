class Tag < ActiveRecord::Base
  attr_accessible :name
  validates_presence_of :name, :message => '- El campo Palabra Clave no puede ser blanco' 
  validates_uniqueness_of :name
  validates_length_of :name, :in => 3..225, :message => '- El campo Palabra Clave no puede ser ni menor de 3 ni mayor de 225 caracteres' 
end

