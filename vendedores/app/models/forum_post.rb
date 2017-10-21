# encoding: utf-8
class ForumPost < ActiveRecord::Base
  attr_accessible :name, :subject, :body, :root_id, :parent_id, :lft, :rgt, :depth

    make_like_a_tree
  
  validates_length_of :name, :within => 2..50, :message   => '- El nombre es demasiado corto, debe ser mínimo 1 carácter y máximo 50'
  validates_length_of :subject, :within => 5..255, :message   => '- El Asunto es demasiado corto, debe ser mínimo 5 caracteres y máximo 255'
  validates_length_of :body, :within => 5..5000, :message   => '- El Mensaje es demasiado corto, debe ser mínimo 1 carácter y máximo 5000'
end


