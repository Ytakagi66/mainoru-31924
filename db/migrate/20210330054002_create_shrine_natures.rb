class CreateShrineNatures < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_natures do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :nature, null: false, foreign_key: true
      t.timestamps
    end
  end
end
