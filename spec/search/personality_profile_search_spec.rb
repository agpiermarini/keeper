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
      # VCR.use_cassette("watson-personality-profile") do
        it 'returns a personality profile' do
          VCR.turned_off do
            WebMock.allow_net_connect!
            expect(subject.profile).to be_a PersonalityProfile
            WebMock.disable_net_connect!
          end
      end
    end
  end
end
