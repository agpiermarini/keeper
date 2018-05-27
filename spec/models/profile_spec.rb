require 'rails_helper'

describe Profile do
  subject { Profile.new({}) }
  it 'initializes with profile information' do
    expect(subject).to be_a Profile
    expect(subject).to respond_to(:username)
    expect(subject).to respond_to(:description)
    expect(subject).to respond_to(:location)
    expect(subject).to respond_to(:avatar_url)
    expect(subject).to respond_to(:followers_count)
    expect(subject).to respond_to(:following_count)
    expect(subject).to respond_to(:tweet_count)
    expect(subject).to respond_to(:last_tweet)
  end

  describe 'instance methods' do
    describe '#avatar_url' do
      it 'converts thumbnail to 400x400 image' do
        profile = Profile.new( {profile_image_url: "https://image.com/23pj234_normal.jpeg"} )
        expect(profile.avatar_url).to eq("https://image.com/23pj234_400x400.jpeg")
      end
    end

    describe '#last_tweet' do
      it 'returns text value of status hash' do
        profile = Profile.new( {status: {text: "tweet"} } )
        expect(profile.last_tweet).to eq("tweet")
      end
    end

    describe '#last_tweet_date' do
      it 'returns date value of status hash' do
        profile = Profile.new( {status: {created_at: "Fri May 25 20:56:39 +0000 2018"} } )
        expect(profile.last_tweet_date).to eq("May 25, 2018")
      end
    end
  end
end
