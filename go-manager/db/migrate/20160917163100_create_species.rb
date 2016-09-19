class CreateSpecies < ActiveRecord::Migration[5.0]
  def change
    create_table :species do |t|
      t.integer :species_no, null: false
      t.string :name, null: false
      t.integer :base_attack, null: false
      t.integer :base_defense, null: false
      t.integer :base_stamina, null: false

      t.timestamps
    end
    add_index :species, :species_no, unique: true
    add_index :species, :name, unique: true
  end
end
