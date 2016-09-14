class AppraisalOverallPhrase < ApplicationRecord

  # every AppraisalOverallPhrase is linked to a TeamLeader, through team_leader_id
  belongs_to :team_leader

end
