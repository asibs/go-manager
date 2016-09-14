class MonsterEvolution < ApplicationRecord

  # every MonsterEvolution is linked to a Monster, through monster_id
  belongs_to :monster

  # a MonsterEvolution has many MonsterLevels
  has_many :monster_level

end
