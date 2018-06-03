require 'rails_helper'

describe SavedProfile, type: :model do
  describe 'relationships' do
    it {should belong_to :user}
    it {should belong_to :personality_profile}
  end
end
