class ChangeMonsterAppraisalColumnsToLinkToAppraisalPhrases < ActiveRecord::Migration[5.0]
  def change
    remove_column :monster_appraisals, :min_total_iv, :integer
    remove_column :monster_appraisals, :max_total_iv, :integer
    remove_column :monster_appraisals, :min_best_iv, :integer
    remove_column :monster_appraisals, :max_best_iv, :integer

    add_column :monster_appraisals, :appraisal_individual_phrase_id, :integer
    add_column :monster_appraisals, :appraisal_overall_phrase_id, :integer
  end
end
