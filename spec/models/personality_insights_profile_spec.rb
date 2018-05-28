require 'rails_helper'

describe PersonalityInsightsProfile do
  let(:data)     { stub_profile }
  subject { PersonalityInsightsProfile.new(data) }
  VCR.use_cassette("personality-insight-profile-initialize") do
    it 'initializes with username and personality profile data' do
      expect(subject).to be_a PersonalityInsightsProfile
    end
  end

  describe 'instance methods' do
    describe '#personality' do
      VCR.use_cassette("personality-insight-profile-personality") do
        it 'returns an array of personality characteristics' do
          expect(subject.personality).to be_a Array
          expect(subject.personality.first).to be_a Dimension
        end
      end
    end
  end
end
