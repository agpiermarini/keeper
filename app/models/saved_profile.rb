class SavedProfile < ApplicationRecord
  belongs_to :user
  belongs_to :personality_profile

  validates :personality_profile_id, uniqueness: true
end
