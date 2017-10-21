class CreateOrderItems < ActiveRecord::Migration

  def up
    create_table :order_items do |t|
      t.integer :book_id
      t.integer :order_id
      t.float :price
      t.integer :amount
      t.timestamps
    end
  end
  
  def down
    drop_table :order_items
  end

end
