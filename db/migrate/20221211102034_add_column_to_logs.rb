class AddColumnToLogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :logs, :site, null: false, foreign_key: true
  end
end
