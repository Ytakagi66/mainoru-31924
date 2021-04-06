class TempleFestival < ApplicationRecord
  belongs_to :temple, optional: true
  belongs_to :festival, optional: true  
end
