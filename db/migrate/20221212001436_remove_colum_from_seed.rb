class RemoveColumFromSeed < ActiveRecord::Migration[7.0]
  def change
    remove_column :seeds, :user_id, :integer
  end
end
