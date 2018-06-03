require 'rails_helper'

describe Dimension, type: :model do
  describe 'relationships' do
    it {should belong_to :personality_profile}
    it {should have_many :facets}
  end
end
