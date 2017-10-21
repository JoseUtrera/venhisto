class CreatePublishers < ActiveRecord::Migration
  def up
    create_table :publishers do |t|
      t.column :name, :string, :limit => 255, :null => false, :unique => true
      t.timestamps
    end
  end

  def down
    drop_table :publishers
  end
end

