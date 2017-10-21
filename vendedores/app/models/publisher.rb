# encoding: utf-8
class Publisher < ActiveRecord::Base
  has_many :books
  attr_accessible :name
  validates_presence_of :name, :message => '- El campo Nombre no puede ser blanco' 
  validates_uniqueness_of :name, :message => '- Este Editor ya existe, debe ser único' 
  validates_length_of :name, :in => 2..225, :message => '- El Nombre debe ser mínimo 1 carácter y máximo 255'
end
