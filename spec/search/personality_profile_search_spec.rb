require 'rails_helper'

describe PersonalityProfileSearch do
  let(:username) { 'turingschool' }
  let(:data) { "this is a test string " * 25 }
  subject { PersonalityProfileSearch.new(data) }
  it 'initializes with username' do
    expect(subject).to be_a PersonalityProfileSearch
  end

  describe 'instance methods' do
    describe '#profile_info' do
      it 'returns a hash of personality profile information' do
        VCR.use_cassette("watson-personality-profile") do
          expect(subject.profile_info).to be_a Hash
          expect(subject.profile_info).to have_key(:word_count)
          expect(subject.profile_info).to have_key(:word_count_message)
          expect(subject.profile_info).to have_key(:personality)
          expect(subject.profile_info).to have_key(:needs)
          expect(subject.profile_info).to have_key(:values)
        end
      end
    end
  end
end
