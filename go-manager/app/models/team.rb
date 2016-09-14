class Team < ApplicationRecord

  # a Team has one TeamLeader
  has_one :team_leader

  # a Team has many Trainers
  has_many :trainers

end
