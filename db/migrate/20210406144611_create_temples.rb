class CreateTemples < ActiveRecord::Migration[6.0]
  def change
    create_table :temples do |t|

      t.timestamps
    end
  end
end
