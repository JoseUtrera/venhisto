class CreateAuthors < ActiveRecord::Migration
  def up
    create_table :authors do |t|
      t.column :first_name, :string
      t.column :last_name, :string
      t.timestamps
    end
  end
  
  def down
    drop_table :authors
  end
end
