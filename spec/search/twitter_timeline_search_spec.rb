require 'rails_helper'

describe TwitterTimelineSearch do
  subject { TwitterTimelineSearch.new("turingschool") }
  it 'initializes with valid twitter username' do
    expect(subject).to be_a TwitterTimelineSearch
  end

  describe 'instance methods' do
    describe '#user_timeline' do
      it 'returns an array of hashes of users most recent statuses excluding retweets (max 3,200 including retweets)' do
        VCR.use_cassette("twitter-timeline-search-user-timeline") do
          expect(subject.user_timeline).to be_an Array
          expect(subject.user_timeline.count).to eq(885)
          expect(subject.user_timeline.first[:date]).to be_a String
          expect(subject.user_timeline.first[:text]).to be_a String
        end
      end
    end

    describe '#to_string' do
      it 'returns a single string of tweets from user timeline' do
        VCR.use_cassette("twitter-timeline-search-to-string") do
          expect(subject.to_string).to be_a String
          expect(subject.to_string.length).to eq(97337)
        end
      end
    end

    describe '#newest_tweet' do
      it 'returns formatted date of newest tweet returned in the query' do
        VCR.use_cassette("twitter-timeline-search-newest-tweet") do
          expect(subject.newest_tweet).to be_a String
          expect(subject.newest_tweet).to eq("May 21, 2018")
        end
      end
    end

    describe '#oldest_tweet' do
      it 'returns formatted date of newest tweet returned in the query' do
        VCR.use_cassette("twitter-timeline-search-oldest-tweet") do
          expect(subject.oldest_tweet).to be_a String
          expect(subject.oldest_tweet).to eq("April 23, 2015")
        end
      end
    end
  end
end
