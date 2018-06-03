class SavedProfile < ApplicationRecord
  belongs_to :user
  belongs_to :personality_profile
end
