class AddColumnLogs < ActiveRecord::Migration[7.0]
  def change
    add_column :logs, :title, :string
    add_column :logs, :description, :text
    add_column :logs, :date, :date
  end
end
