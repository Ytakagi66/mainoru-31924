class ShrineHistory < ApplicationRecord
  belongs_to :shrine, optional: true
  belongs_to :history, optional: true    
end
