class ChangeMaxIndividualId < ActiveRecord::Migration[5.0]
  def change
    rename_column :appraisal_individual_phrases, :max_individual_id, :max_individual_iv
  end
end
