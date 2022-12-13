class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.references :mood, null: false, foreign_key: true
      t.references :log, null: false, foreign_key: true
      t.references :seed, null: false, foreign_key: true
      t.timestamps
    end
  end
end
