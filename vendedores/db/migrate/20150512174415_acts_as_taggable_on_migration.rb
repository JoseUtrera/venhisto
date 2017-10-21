# encoding: utf-8 

class ActsAsTaggableOnMigration < ActiveRecord::Migration
  
  def up
    
    create_table :tags do |t|
      t.string :name, :limit => 255, :null => false, :unique => true
      t.timestamps
    end

    create_table :taggings do |t|
      t.references :tag
      # Nos aseguramos que la columna es lo suficientemente grande
      
      t.references :taggable, :polymorphic => true
      t.references :tagger, :polymorphic => true
      # Limit se crea para prevenir errores en MYSQL sobre el index
      
      t.string :context, :limit => 128
      t.datetime :created_at
    end

    add_index :taggings, :tag_id
    add_index :taggings, [:taggable_id, :taggable_type, :context]

    say_with_time 'Adding foreing keys' do
      # Añade las claves foráneas a la tabla  taggins 
      execute 'ALTER TABLE taggings ADD CONSTRAINT fk_taggings_tags
              FOREIGN KEY (tag_id) REFERENCES tags(id) ON DELETE CASCADE'      
      execute 'ALTER TABLE taggings ADD CONSTRAINT fk_taggings_books
              FOREIGN KEY (taggable_id) REFERENCES books(id) ON DELETE CASCADE'
    end

    # Ejecuta el procedimiento sql
    say_with_time 'Adding default tags' do
      execute(insert_tags_sql)
    end
  end

  def down
    drop_table :taggings
    drop_table :tags
  end

# SQL que añade 5 Tags por defecto   
  def insert_tags_sql
    <<-END_OF_DATA
    insert into tags values
    (1, 'Acción', "#{Time.now}", "#{Time.now}"),
    (2, 'Ciencia', "#{Time.now}", "#{Time.now}"),
    (3, 'Ciencia ficción', "#{Time.now}", "#{Time.now}"),
    (4, 'Misterio', "#{Time.now}", "#{Time.now}"),
    (5, 'Romance', "#{Time.now}", "#{Time.now}")
    END_OF_DATA
  end
end
