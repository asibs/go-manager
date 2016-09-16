class AddMinTotalIvAndMaxTotalIvToMonsterSummaries < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_summaries, :min_total_iv, :integer
    add_column :monster_summaries, :max_total_iv, :integer
  end
  add_index :monster_summaries, :monster_id, unique: true
end
