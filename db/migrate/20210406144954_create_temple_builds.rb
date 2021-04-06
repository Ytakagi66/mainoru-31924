class CreateTempleBuilds < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_builds do |t|

      t.timestamps
    end
  end
end
