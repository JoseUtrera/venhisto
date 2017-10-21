class CreateUserSessions < ActiveRecord::Migration
  def change
    create_table :user_sessions do |t|

      t.timestamps
    end
  end
  
  
  def up
  end
  
  def down
  end

  
  
  
end
