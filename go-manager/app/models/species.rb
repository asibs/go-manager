class Species < ApplicationRecord

  # a Species has one SpeciesBaseStats
  has_one :species_base_stats

end
