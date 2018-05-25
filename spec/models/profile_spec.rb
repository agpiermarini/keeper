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
end
