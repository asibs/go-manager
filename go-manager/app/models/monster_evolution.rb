class MonsterEvolution < ApplicationRecord

  # every MonsterEvolution is linked to a Monster, through monster_id
  belongs_to :monster

  # every MonsterEvolution is linked to a Species, through species_id
  belongs_to :species

  # a MonsterEvolution has many MonsterLevels
  has_many :monster_level, -> { order 'id DESC' }

  def current_level
    # Just get the first, since we're ordering in the association
    self.monster_level.first
  end

end
