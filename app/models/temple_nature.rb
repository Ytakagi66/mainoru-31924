class TempleNature < ApplicationRecord
  belongs_to :temple, optional: true
  belongs_to :nature, optional: true  
end
