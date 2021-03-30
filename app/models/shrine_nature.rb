class ShrineNature < ApplicationRecord
  belongs_to :shrine, optional: true
  belongs_to :nature, optional: true  
end
