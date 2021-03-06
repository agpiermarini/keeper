require 'rails_helper'

describe TwitterProfileSearch do
  subject { TwitterProfileSearch.new('turingschool') }
  it 'initializes when passed a username' do
    expect(subject).to be_a TwitterProfileSearch
  end

  describe 'instance methods' do
    describe '#profile' do
      it 'returns profile object' do
        VCR.use_cassette("twitter-profile-search") do
          expect(subject.profile).to be_a Profile
          expect(subject.profile.username).to eq('turingschool')
          expect(subject.profile.name).to eq('Turing School')
          expect(subject.profile.location).to eq('Denver, CO')
          expect(subject.profile.description).to eq('We unlock human potential by training a diverse, inclusive student body to succeed in high-fulfillment technical careers.')
          expect(subject.profile.followers_count).to eq(2764)
          expect(subject.profile.following_count).to eq(587)
          expect(subject.profile.last_tweet).to eq("RT @joshuajhun: Come to my workshop this Friday! Bring yourself, your computer, a notebook and some dope #vibes. I'll have plenty of #gifs…")
          expect(subject.profile.tweet_count).to eq(3911)
          expect(subject.profile.avatar_url).to eq("http://pbs.twimg.com/profile_images/444146105312243712/EHdy1GyV_400x400.png")
        end
      end
    end
  end
end
