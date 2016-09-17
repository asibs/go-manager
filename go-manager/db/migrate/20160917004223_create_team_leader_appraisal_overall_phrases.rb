class CreateTeamLeaderAppraisalOverallPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :team_leader_appraisal_overall_phrases do |t|
      t.integer :team_leader_id
      t.integer :appraisal_overall_id
      t.string :phrase

      t.timestamps
    end
    add_index :team_leader_appraisal_overall_phrases, :phrase, unique: true
    add_index :team_leader_appraisal_overall_phrases, [:team_leader_id, :appraisal_overall_id], unique: true, name: 'index_team_leader_appraisal_overall_phrases_on_foreign_keys'
  end
end
