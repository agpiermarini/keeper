require 'rails_helper'

describe Value, type: :model do
  describe 'relationships' do
    it {should belong_to :personality_profile }
  end
end
