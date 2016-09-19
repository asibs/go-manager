class CreateAppraisalOveralls < ActiveRecord::Migration[5.0]
  def change
    create_table :appraisal_overalls do |t|
      t.string :appraisal_class, null: false
      t.integer :min_total_iv, null: false
      t.integer :max_total_iv, null: false

      t.timestamps
    end
    add_index :appraisal_overalls, :appraisal_class, unique: true
  end
end
