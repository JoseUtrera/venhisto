
class Author < ActiveRecord::Base
  
  has_and_belongs_to_many :books 
  
  attr_accessible :first_name, :last_name
  
  validates_presence_of :first_name, :message => '- El campo Nombre no puede ser blanco' 
  validates_presence_of :last_name, :message => '- El campo Apellidos no puede ser blanco' 
  
  def name
    "#{first_name} #{last_name}"  
  end

end
