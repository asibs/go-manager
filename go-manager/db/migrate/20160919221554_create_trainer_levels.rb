class CreateTrainerLevels < ActiveRecord::Migration[5.0]
  def change
    create_table :trainer_levels do |t|
      t.integer :level, null: false
      t.integer :total_xp, null: false
      t.integer :xp_to_next_level, null: true

      t.timestamps
    end
    add_index :trainer_levels, :level, unique: true
  end
end
