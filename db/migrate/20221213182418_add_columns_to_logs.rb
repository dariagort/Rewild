class AddColumnsToLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :mood_id, :integer
    add_column :logs, :seed_id, :integer
  end
end
