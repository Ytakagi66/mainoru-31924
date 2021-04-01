class CreateShrineBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_builds do |t|
      t.references :shrine, null: false, foreign_key: true
      t.references :build, null: false, foreign_key: true
      t.timestamps
    end
  end
end
