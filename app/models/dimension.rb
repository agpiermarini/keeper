class Dimension < ApplicationRecord
  belongs_to :personality_profile, dependent: :destroy
  has_many   :facets
end
