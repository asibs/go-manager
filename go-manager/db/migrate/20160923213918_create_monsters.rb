class CreateMonsters < ActiveRecord::Migration[5.0]
  def change
    create_table :monsters do |t|
      t.string :slug, null: false
      t.string :name
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :monsters, :slug, unique: true
    add_index :monsters, :user_id
  end
end
