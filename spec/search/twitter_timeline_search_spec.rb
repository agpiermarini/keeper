require 'rails_helper'

describe TwitterTimelineSearch do
  subject { TwitterTimelineSearch.new("turingschool") }
  it 'initializes with valid twitter username' do
    expect(subject).to be_a TwitterTimelineSearch
  end

  describe 'instance methods' do
    describe '#user_timeline' do
      it 'returns an array of hashes of users most recent statuses excluding retweets (max 3,200 including retweets)' do
        VCR.use_cassette("twitter-timline-search") do
          expect(subject.user_timeline).to be_an Array
          expect(subject.user_timeline.count).to eq(885)
          expect(subject.user_timeline.first[:date]).to be_a String
          expect(subject.user_timeline.first[:text]).to be_a String
        end
      end
    end
  end
end
