require 'rails_helper'

describe PersonalityProfile, type: :model do
  describe 'relationships' do
    it {should have_many :dimensions }
    it {should have_many :needs }
    it {should have_many :values }
  end
end
