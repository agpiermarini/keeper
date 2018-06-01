require 'rails_helper'

describe TwitterUserSearch do
  let(:user) { create(:user, oauth_token: ENV["twitter_oauth_token"], oauth_secret: ENV["twitter_oauth_secret"]) }
  subject { TwitterUserSearch.new(user, 'turingschool') }
  it 'initializes with username query' do
    expect(subject).to be_a TwitterUserSearch
  end

  describe 'instance methods' do
    describe '#results' do
      it 'returns a search results object' do
        VCR.use_cassette('twitter-user-search') do
          allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
          expect(subject.results).to be_an Array
        end
      end
    end
  end
end
