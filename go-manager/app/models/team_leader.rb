class TeamLeader < ApplicationRecord

  # every TeamLeader is linked to a Team, through team_id
  belongs_to :team

  # a TeamLeader has many AppraisalOverallPhrases
  has_many :appraisal_overall_phrases

  # a TeamLeader has many AppraisalIndividualPhrases
  has_many :appraisal_individual_phrases

end
