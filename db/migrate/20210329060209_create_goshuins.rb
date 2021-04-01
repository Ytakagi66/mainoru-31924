class CreateGoshuins < ActiveRecord::Migration[6.0]
  def change
    create_table :goshuins do |t|
      t.string :title
      t.text :text
      t.references :user, foreign_key: true, null: false
      t.timestamps
    end
  end
end
