require 'rails_helper'

describe Need, type: :model do
  describe 'relationships' do
    it {should belong_to :personality_profile}
  end
end
