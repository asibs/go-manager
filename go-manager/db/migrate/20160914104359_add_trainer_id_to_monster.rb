class AddTrainerIdToMonster < ActiveRecord::Migration[5.0]
  def change
    add_column :monsters, :trainer_id, :integer
  end
end
