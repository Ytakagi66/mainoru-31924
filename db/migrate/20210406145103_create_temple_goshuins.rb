class CreateTempleGoshuins < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_goshuins do |t|

      t.timestamps
    end
  end
end
