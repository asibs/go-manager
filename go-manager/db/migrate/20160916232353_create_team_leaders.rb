class CreateTeamLeaders < ActiveRecord::Migration[5.0]
  def change
    create_table :team_leaders do |t|
      t.string :name
      t.integer :team_id

      t.timestamps
    end
    add_index :team_leaders, :name, unique: true
    add_index :team_leaders, :team_id, unique: true
  end
end
