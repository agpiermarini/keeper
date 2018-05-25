require 'rails_helper'

describe ProfileSearch do
  subject { ProfileSearch.new('turingschool') }
  it 'initializes when passed a username' do
    expect(subject).to be_a ProfileSearch
  end

  describe 'instance methods' do
    describe '#profile' do
      it 'returns profile object' do
        VCR.use_cassette("twitter-profile-search") do
          expect(subject.profile).to be_a Profile
        end
      end
    end
  end
end
