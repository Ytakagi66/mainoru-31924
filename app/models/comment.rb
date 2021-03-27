class Comment < ApplicationRecord
  has_many :shrine_comments, dependent: :destroy
  has_many :shrines, through: :shrine_comments, validate: false
  belongs_to :user
  has_one_attached :image

  def was_attached?
    self.image.attached?
  end
end
