class Shrine < ApplicationRecord
  belongs_to :user
  has_many_attached :images

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :benefits

  with_options presence: true do
    validates :image
    validates :address
    validates :latitude
    validates :longitude
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0 } do
    validates :benefits_id
  end

  geocoded_by :address
  before_validation :geocode, if: :address_changed?

end
