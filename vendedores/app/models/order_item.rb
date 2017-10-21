# encoding: utf-8

class OrderItem < ActiveRecord::Base

  attr_accessible :book_id, :order_id, :price, :amount


  belongs_to :order
  belongs_to :book

  def validate
    errors.add(:amount, "Cantidad - debería ser uno o más") unless amount.nil? || amount > 0
    errors.add(:price, "- Precio debería ser postitivo") unless price.nil? || price > 0.0
  end
  
  
end
