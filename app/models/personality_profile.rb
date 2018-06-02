class PersonalityProfile < ApplicationRecord
  has_many :dimensions
  has_many :facets, through: :dimensions
  has_many :needs
  has_many :values
  has_many :facets
end
