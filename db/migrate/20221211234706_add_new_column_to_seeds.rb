class AddNewColumnToSeeds < ActiveRecord::Migration[7.0]
  def change
    add_column :seeds, :date, :date
  end
end
