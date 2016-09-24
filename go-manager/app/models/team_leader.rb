class TeamLeader < ApplicationRecord

  belongs_to :team
  has_many :team_leader_appraisal_overall_phrase
  has_many :team_leader_appraisal_best_stat_phrase

end
