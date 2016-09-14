class RenameMonsterNoToMonsterIdInSpeciesBaseStats < ActiveRecord::Migration[5.0]
  def change
    rename_column :species_base_stats, :monster_no, :monster_id
  end
end
