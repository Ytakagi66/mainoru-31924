class Shrine < ApplicationRecord

  belongs_to :user
  has_many_attached :images
  has_many :shrine_comments, dependent: :destroy
  has_many :comments, through: :shrine_comments, validate: false

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :benefits

  with_options presence: true do
    validates :images
    validates :latitude
    validates :longitude
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
  end

  geocoded_by :address
  before_validation :geocode, if: :address_changed?

end