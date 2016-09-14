class AddMonsterIdToMonsterSummary < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_summaries, :monster_id, :integer
  end
end
