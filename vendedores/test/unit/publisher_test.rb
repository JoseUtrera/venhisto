require File.dirname(__FILE__) + '/../test_helper'

class PublisherTest < ActiveSupport::TestCase
  fixtures :publishers  
   
  # Chequea las validaciones del Modelo Publisher
  def test_failing_create
    publisher = Publisher.new
    assert_equal false, publisher.save
    assert_equal 2, publisher.errors.count
    assert publisher.errors[:name]
  end
  
  # Testea que un editor válido puede grabarse en la bd
  def test_create
    publisher = Publisher.new(
      :name => 'Salvat'
     )
    assert_equal publisher.save, true
  end
end
