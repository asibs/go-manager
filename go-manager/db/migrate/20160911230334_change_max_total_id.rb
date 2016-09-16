class ChangeMaxTotalId < ActiveRecord::Migration[5.0]
  def change
    rename_column :appraisal_overall_phrases, :max_total_id, :max_total_iv
  end
end
