class CreateTempleFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_festivals do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :festival, null: false, foreign_key: true
      t.timestamps
    end
  end
end
