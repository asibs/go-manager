class AddMonsterEvolutionIdToMonsterLevels < ActiveRecord::Migration[5.0]
  def change
    add_column :monster_levels, :monster_evolution_id, :integer
  end
end
