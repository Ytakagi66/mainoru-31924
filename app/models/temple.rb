class Temple < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :temple_festivals, dependent: :destroy
  has_many :festivals, through: :temple_festivals, validate: false
  has_many :temple_goshuins, dependent: :destroy
  has_many :goshuins, through: :temple_goshuins, validate: false
  has_many :temple_builds, dependent: :destroy
  has_many :builds, through: :temple_builds, validate: false
  has_many :temple_natures, dependent: :destroy
  has_many :natures, through: :temple_natures, validate: false
  has_many :temple_histories, dependent: :destroy
  has_many :histories, through: :temple_histories, validate: false

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :benefits

  with_options presence: true do
    validates :images
    validates :latitude
    validates :longitude
    validates :name, length: { maximum: 40 }
    validates :info, length: { maximum: 1000 }
    validates :address
  end

  geocoded_by :address
  before_validation :geocode, if: :address_changed?
end
