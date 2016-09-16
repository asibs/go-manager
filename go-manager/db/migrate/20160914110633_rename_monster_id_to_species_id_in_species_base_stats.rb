class RenameMonsterIdToSpeciesIdInSpeciesBaseStats < ActiveRecord::Migration[5.0]
  def change
    rename_column :species_base_stats, :monster_id, :species_id
  end
end
