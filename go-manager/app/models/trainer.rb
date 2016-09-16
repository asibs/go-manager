class Trainer < ApplicationRecord

  # every Trainer is linked to a Team, through team_id
  belongs_to :team

  # a Trainer has many Monsters
  has_many :monster

end
