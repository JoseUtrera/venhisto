class CreateCartItems < ActiveRecord::Migration
  
  def up
    create_table :cart_items do |t|
      t.column :book_id, :integer
      t.column :cart_id, :integer
      t.column :price, :float
      t.column :amount, :integer
      t.timestamps
    end
  end
  
  def down
    drop_table :cart_items
  end
  
end
