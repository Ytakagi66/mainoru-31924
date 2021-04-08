class TempleGoshuin < ApplicationRecord
  belongs_to :temple, optional: true
  belongs_to :goshuin, optional: true
end
