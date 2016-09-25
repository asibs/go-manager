class CreateMonsterEvolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_evolutions do |t|
      t.string :slug, null: false
      t.integer :monster_id, null: false
      t.integer :species_id, null: false

      t.timestamps
    end
    add_index :monster_evolutions, :slug, unique: true
    add_index :monster_evolutions, [:monster_id, :species_id], unique: true
  end
end
