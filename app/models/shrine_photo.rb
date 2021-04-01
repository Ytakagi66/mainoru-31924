class ShrinePhoto < ApplicationRecord
  belongs_to :shrine
  mount_uploader :image, ImageUploader
end
