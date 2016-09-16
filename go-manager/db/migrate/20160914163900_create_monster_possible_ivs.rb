class CreateMonsterPossibleIvs < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_possible_ivs do |t|
      t.integer :monster_id
      t.integer :level_id
      t.integer :attack
      t.integer :defense
      t.integer :stamina
      t.integer :maxed_cp
      t.integer :maxed_hp

      t.timestamps
    end
  end
end
