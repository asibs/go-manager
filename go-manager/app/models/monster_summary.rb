class MonsterSummary < ApplicationRecord

  # every MonsterSummary is linked to a Monster, through monster_id
  belongs_to :monster

end
