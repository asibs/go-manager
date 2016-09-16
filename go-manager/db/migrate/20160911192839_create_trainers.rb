class CreateTrainers < ActiveRecord::Migration[5.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :current_level
      t.integer :team_id

      t.timestamps
    end
  end
end
