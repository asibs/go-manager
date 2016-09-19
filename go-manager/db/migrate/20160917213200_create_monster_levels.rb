class CreateMonsterLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_levels do |t|
      t.decimal :level, precision: 6, scale:2, null: false
      t.decimal :cp_multiplier, precision: 20, scale: 19, null: false
      t.integer :dust_to_level_up, null: true
      t.integer :candy_to_level_up, null: true

      t.timestamps
    end
    add_index :monster_levels, :level, unique: true
    add_index :monster_levels, :dust_to_level_up, unique: false
  end
end
