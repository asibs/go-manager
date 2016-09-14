class AddTeamLeaderIdToAppraisalIndividualPhrases < ActiveRecord::Migration[5.0]
  def change
    add_column :appraisal_individual_phrases, :team_leader_id, :integer
  end
end
