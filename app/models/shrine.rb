class Shrine < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :benefits
  belongs_to :prefecture

  with_options presence: true do
    validates :image
    validates :latitude
    validates :longitude
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0 } do
    validates :prefecture_id
    validates :benefits_id
  end
end
