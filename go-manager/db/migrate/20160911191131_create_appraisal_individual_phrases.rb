class CreateAppraisalIndividualPhrases < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisal_individual_phrases do |t|
      t.string :phrase
      t.integer :min_individual_iv
      t.integer :max_individual_id

      t.timestamps
    end
  end
end
