class ShrineFestival < ApplicationRecord
  belongs_to :shrine, optional: true
  belongs_to :festival, optional: true  
end
