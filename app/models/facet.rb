class Facet < ApplicationRecord
  belongs_to :dimension, dependent: :destroy
end
