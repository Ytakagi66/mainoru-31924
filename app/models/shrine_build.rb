class ShrineBuild < ApplicationRecord
  belongs_to :shrine, optional: true
  belongs_to :build, optional: true  
end
