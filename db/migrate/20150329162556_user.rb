class User < ActiveRecord::Migration
  def up
  end

  def down
  end

  def change
    create_table :users do |t|
      t.string :username
      t.text :rhythm

      t.timestamps null: false
    end
  end
end
