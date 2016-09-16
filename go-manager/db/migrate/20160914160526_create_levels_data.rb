class CreateLevelsData < ActiveRecord::Migration[5.0]
  def change
    create_table :levels_data do |t|
      t.decimal :level, precision: 6, scale:2
      t.decimal :cp_multiplier, precision: 20, scale: 19
      t.integer :stardust_to_power_up
      t.integer :candy_to_power_up

      t.timestamps
    end
    add_index :levels_data, :level, unique: true
    add_index :levels_data, :stardust_to_power_up, unique: false
  end
end
