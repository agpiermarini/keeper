class Need < ApplicationRecord
  belongs_to :personality_profile, dependent: :destroy
end
