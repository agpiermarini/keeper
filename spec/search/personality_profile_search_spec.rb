require 'rails_helper'

describe PersonalityProfileSearch do
  let(:username) { 'turingschool' }
  let(:data) { "this is a test string " * 25 }
  subject { PersonalityProfileSearch.new(username, data) }
  it 'initializes with username' do
    expect(subject).to be_a PersonalityProfileSearch
  end

  describe 'instance methods' do
    describe '#profile' do
      it 'returns a personality profile' do
        VCR.use_cassette("watson-personality-profile") do
          expect(subject.profile).to be_a PersonalityProfile
          expect(subject.profile.word_count).to eq(125)
          expect(subject.profile.word_count_message).to include("We need a minimum of 600")
        end
      end
    end
  end
end
