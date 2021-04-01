class ShrineComment < ApplicationRecord
  belongs_to :shrine, optional: true
  belongs_to :comment, optional: true
end
