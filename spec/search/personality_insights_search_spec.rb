require 'rails_helper'

describe PersonalityInsightsSearch do
  let(:username) { 'turingschool' }
  let(:data) { "this is a test string " * 25 }
  subject { PersonalityInsightsSearch.new(username, data) }
  it 'initializes with username' do
    expect(subject).to be_a PersonalityInsightsSearch
  end

  describe 'instance methods' do
    describe '#profile' do
      it 'returns a personality profile' do
        VCR.use_cassette("watson-personality-profile") do
          expect(subject.profile).to be_a PersonalityInsightsProfile
          expect(subject.profile.word_count).to eq(125)
          expect(subject.profile.word_count_message).to include("We need a minimum of 600")
        end
      end
    end
  end
end
