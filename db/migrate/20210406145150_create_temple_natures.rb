class CreateTempleNatures < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_natures do |t|

      t.timestamps
    end
  end
end
