class CreateShrinePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :shrine_photos do |t|
      t.string :image, null: false
      t.references :shrine, foreign_key: true, null: false
      t.timestamps
    end
  end
end
