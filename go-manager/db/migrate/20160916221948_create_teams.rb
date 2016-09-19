class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string :name, null: false
      t.string :color, null: false

      t.timestamps
    end
    add_index :teams, :name, unique: true
    add_index :teams, :color, unique: true
  end
end
