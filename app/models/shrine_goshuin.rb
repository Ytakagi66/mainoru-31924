class ShrineGoshuin < ApplicationRecord
  belongs_to :shrine, optional: true
  belongs_to :goshuin, optional: true
end
