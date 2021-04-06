class CreateTempleHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :temple_histories do |t|

      t.timestamps
    end
  end
end
