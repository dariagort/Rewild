class AddColumnSiteIdToMoods < ActiveRecord::Migration[7.0]
  def change
    add_reference :moods, :site, null: false, foreign_key: true
  end
end
