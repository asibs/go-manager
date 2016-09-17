class CreateSpecies < ActiveRecord::Migration[5.0]
  def change
    create_table :species do |t|
      t.integer :species_no
      t.string :name
      t.integer :base_attack
      t.integer :base_defense
      t.integer :base_stamina

      t.timestamps
    end
    add_index :species, :species_no, unique: true
    add_index :species, :name, unique: true
  end
end
