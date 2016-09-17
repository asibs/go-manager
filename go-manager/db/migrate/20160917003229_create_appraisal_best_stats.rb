class CreateAppraisalBestStats < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisal_best_stats do |t|
      t.string :appraisal_class
      t.integer :min_stat_iv
      t.integer :max_stat_iv

      t.timestamps
    end
    add_index :appraisal_best_stats, :appraisal_class, unique: true
  end
end
