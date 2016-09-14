class CreateAppraisalOverallPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisal_overall_phrases do |t|
      t.string :phrase
      t.integer :min_total_iv
      t.integer :max_total_id

      t.timestamps
    end
  end
end
