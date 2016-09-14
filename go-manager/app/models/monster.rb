class Monster < ApplicationRecord

  # every Monster is linked to a Trainer, through trainer_id
  belongs_to :trainer

  # a Monster has one MonsterSummary
  has_one :monster_summary

  # a Monster has one MonsterAppraisal
  has_one :monster_appraisal

  # a Monster has many MonsterEvolutions
  has_many :monster_evolution

  # a Monster has many MonsterPossibleIvs
  has_many :monster_possible_iv

end
