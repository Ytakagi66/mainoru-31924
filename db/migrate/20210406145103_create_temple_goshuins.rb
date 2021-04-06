class CreateTempleGoshuins < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_goshuins do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :goshuin, null: false, foreign_key: true
      t.timestamps
    end
  end
end
