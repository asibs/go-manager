class CreateMonsterSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :monster_summaries do |t|
      t.integer :min_attack_iv
      t.integer :max_attack_iv
      t.integer :min_defense_iv
      t.integer :max_defense_iv
      t.integer :min_stamina_iv
      t.integer :max_stamina_iv
      t.integer :min_maxed_cp
      t.integer :max_maxed_cp
      t.integer :min_maxed_hp
      t.integer :max_maxed_hp

      t.timestamps
    end
  end
end
