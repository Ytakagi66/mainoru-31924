class CreateShrineFestivals < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_festivals do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :festival, null: false, foreign_key: true
      t.timestamps
    end
  end
end
