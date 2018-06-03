require 'rails_helper'

describe PersonalityProfile, type: :model do
  it {should have_many :dimensions }
  it {should have_many :needs }
  it {should have_many :values }
  # it {should have_many :facets }
end

  describe "instance methods" do
    subject { PersonalityProfile.new(newest_tweet_analyzed_date: "Tue May 29 16:05:20 +0000 2018",
                                     oldest_tweet_analyzed_date: "Tue May 1 16:05:20 +0000 2018") }
    describe '#newest_tweet' do
      it 'returns date of newest tweet analyzed formatted' do
        expect(subject.newest_tweet).to eq("May 29, 2018")
      end
    end

    describe '#oldest_tweet' do
      it 'returns date of oldest tweet analyzed formatted' do
        expect(subject.oldest_tweet).to eq("May  1, 2018")
      end
    end
end
