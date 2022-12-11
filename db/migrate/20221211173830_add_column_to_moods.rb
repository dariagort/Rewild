class AddColumnToMoods < ActiveRecord::Migration[7.0]
  def change
    add_column :moods, :color, :string
  end
end
