class CreateBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :builds do |t|
      t.string :title
      t.text :text
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
