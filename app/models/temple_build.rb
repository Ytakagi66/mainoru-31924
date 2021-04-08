class TempleBuild < ApplicationRecord
  belongs_to :temple, optional: true
  belongs_to :build, optional: true  
end
