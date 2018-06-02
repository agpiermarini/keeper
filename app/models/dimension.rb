class Dimension < ApplicationRecord
  belongs_to :personality_profile
  has_many   :facets
end
