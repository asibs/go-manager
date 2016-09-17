class CreateTeamLeaderAppraisalBestStatPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :team_leader_appraisal_best_stat_phrases do |t|
      t.integer :team_leader_id
      t.integer :appraisal_best_stat_id
      t.string :phrase

      t.timestamps
    end
    add_index :team_leader_appraisal_best_stat_phrases, :phrase, unique: true
    add_index :team_leader_appraisal_best_stat_phrases, [:team_leader_id, :appraisal_best_stat_id], unique: true, name: 'index_team_leader_appraisal_best_stat_phrases_on_foreign_keys'
  end
end
