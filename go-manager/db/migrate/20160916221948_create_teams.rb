class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.string   "name",   null: false
      t.string   "color",  null: false

      t.timestamps

      t.index ["name"], name: "index_team_on_name", unique: true
      t.index ["color"], name: "index_team_on_color", unique: true
    end
  end
end
