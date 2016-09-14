class CreateSpeciesBaseStats < ActiveRecord::Migration[5.0]
  def change
    create_table :species_base_stats do |t|
      t.integer :monster_no
      t.integer :base_attack
      t.integer :base_defense
      t.integer :base_stamina

      t.timestamps
    end
  end
end
