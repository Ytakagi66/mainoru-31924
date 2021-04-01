class CreateShrineHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_histories do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :history, null: false, foreign_key: true
      t.timestamps
    end
  end
end
