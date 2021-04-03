class Shrine < ApplicationRecord

  belongs_to :user
  has_many_attached :images
  has_many :shrine_comments, dependent: :destroy
  has_many :comments, through: :shrine_comments, validate: false
  has_many :shrine_goshuins, dependent: :destroy
  has_many :goshuins, through: :shrine_goshuins, validate: false
  has_many :shrine_builds, dependent: :destroy
  has_many :builds, through: :shrine_builds, validate: false
  has_many :shrine_natures, dependent: :destroy
  has_many :natures, through: :shrine_natures, validate: false
  has_many :shrine_histories, dependent: :destroy
  has_many :histories, through: :shrine_histories, validate: false

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