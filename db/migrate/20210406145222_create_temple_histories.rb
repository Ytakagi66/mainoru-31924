class CreateTempleHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_histories do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
