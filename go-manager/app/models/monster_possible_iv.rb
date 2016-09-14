class MonsterPossibleIv < ApplicationRecord

  # every MonsterPossibleIv is linked to a Monster, through monster_id
  belongs_to :monster

end
