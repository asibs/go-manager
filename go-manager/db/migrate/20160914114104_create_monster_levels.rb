class CreateMonsterLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_levels do |t|
      t.integer :cp
      t.integer :hp
      t.integer :dust_to_power_up
      t.boolean :never_powered_up

      t.timestamps
    end
  end
end
