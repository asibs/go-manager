class CreateMonsterAppraisals < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_appraisals do |t|
      t.integer :monster_id
      t.integer :min_total_iv
      t.integer :max_total_iv
      t.boolean :attack_best
      t.boolean :defense_best
      t.boolean :stamina_best
      t.integer :min_best_iv
      t.integer :max_best_iv

      t.timestamps
    end
  end
end
