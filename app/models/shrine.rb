class Shrine < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
    validates :benefits_id
  end
end
