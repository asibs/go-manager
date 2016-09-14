class SpeciesBaseStat < ApplicationRecord

  # every SpeciesBaseStat is linked to a Species, through monster_id
  belongs_to :species

end
