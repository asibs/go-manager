class CreateAppraisalBestStats < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisal_best_stats do |t|
      t.string :appraisal_class, null: false
      t.integer :min_stat_iv, null: false
      t.integer :max_stat_iv, null: false

      t.timestamps
    end
    add_index :appraisal_best_stats, :appraisal_class, unique: true
  end
end
