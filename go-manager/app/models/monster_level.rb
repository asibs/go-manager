class MonsterLevel < ApplicationRecord

  # every Monster is linked to a Trainer, through trainer_id
  belongs_to :monster_evolution

end
