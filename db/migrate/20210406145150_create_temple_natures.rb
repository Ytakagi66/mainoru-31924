class CreateTempleNatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_natures do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :nature, null: false, foreign_key: true
      t.timestamps
    end
  end
end
