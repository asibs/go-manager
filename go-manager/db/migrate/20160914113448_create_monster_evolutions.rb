class CreateMonsterEvolutions < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_evolutions do |t|
      t.integer :monster_id
      t.integer :species_id

      t.timestamps
    end
  end
end
