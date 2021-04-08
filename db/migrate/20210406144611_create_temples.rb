class CreateTemples < ActiveRecord::Migration[6.0]
  def change
    create_table :temples do |t|
      t.string :name,           null: false, unique: true
      t.string :info,           null: false
      t.integer :benefits_id,   null: false
      t.string :address,        null: false
      t.float :latitude,        null: false, default: nil
      t.float :longitude,       null: false, default: nil
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
