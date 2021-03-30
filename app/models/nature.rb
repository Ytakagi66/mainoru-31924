class Nature < ApplicationRecord
  has_many :shrine_natures, dependent: :destroy
  has_many :shrines, through: :shrine_natures, validate: false
  belongs_to :user
  has_one_attached :image

  with_options presence: true do
    validates :text
    # validates :image
  end

  def was_attached?
    self.image.attached?
  end  
end
