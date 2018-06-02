require 'rails_helper'

describe TwitterTimelineSearch do
  subject { TwitterTimelineSearch.new("turingschool") }
  it 'initializes with valid twitter username' do
    expect(subject).to be_a TwitterTimelineSearch
  end

  describe 'instance methods' do
    describe '#total_tweets' do
      it 'returns an integer corresponding to the number of tweets in the timeline' do
        VCR.use_cassette("twitter-timeline-search-user-timeline") do
          expect(subject.total_tweets).to be_an Integer
          expect(subject.total_tweets).to eq(886)
        end
      end
    end

    describe '#to_string' do
      it 'returns a single string of tweets from user timeline' do
        VCR.use_cassette("twitter-timeline-search-to-string") do
          expect(subject.to_string).to be_a String
          expect(subject.to_string.length).to eq(97415)
        end
      end
    end

    describe '#newest_tweet' do
      it 'returns formatted date of newest tweet returned in the query' do
        VCR.use_cassette("twitter-timeline-search-newest-tweet") do
          expect(subject.newest_tweet).to be_a String
          expect(subject.newest_tweet).to eq("Tue May 29 16:05:20 +0000 2018")
        end
      end
    end

    describe '#oldest_tweet' do
      it 'returns formatted date of newest tweet returned in the query' do
        VCR.use_cassette("twitter-timeline-search-oldest-tweet") do
          expect(subject.oldest_tweet).to be_a String
          expect(subject.oldest_tweet).to eq("Thu Apr 23 15:36:40 +0000 2015")
        end
      end
    end
  end
end
