class CreateShrines < ActiveRecord::Migration[6.0]
  def change
    create_table :shrines do |t|
      t.string :name,           null: false, unique: true
      t.string :info,           null: false
      t.integer :benefits_id,   null: false
      t.integer :prefecture_id, null: false
      t.string :city,           null: false
      t.string :address,        null: false
      t.float :latitude,        null: false
      t.float :longitude,       null: false
      t.references :user,       null: false, foreign_key: true
      t.timestamps
    end
  end
end
