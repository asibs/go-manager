class RenameMonsterNoToSpeciesNoInSpecies < ActiveRecord::Migration[5.0]
  def change
    rename_column :species, :monster_no, :species_no
  end
end
