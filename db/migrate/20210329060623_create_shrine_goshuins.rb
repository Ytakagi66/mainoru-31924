class CreateShrineGoshuins < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_goshuins do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :goshuin, null: false, foreign_key: true
      t.timestamps
    end
  end
end
