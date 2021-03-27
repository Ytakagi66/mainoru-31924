class CreateShrineComments < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_comments do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.timestamps
    end
  end
end
