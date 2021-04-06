class CreateTempleBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_builds do |t|
      t.references :temple, null: false, foreign_key: true
      t.references :build, null: false, foreign_key: true
      t.timestamps
    end
  end
end
