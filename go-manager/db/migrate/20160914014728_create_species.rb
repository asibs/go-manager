class CreateSpecies < ActiveRecord::Migration[5.0]
  def change
    create_table :species do |t|
      t.integer :monster_no
      t.string :name

      t.timestamps
    end
    add_index :species, :monster_no, unique: true
    add_index :species, :name, unique: true
  end
end
