require 'rails_helper'

context 'User' do
  let(:user) { create(:user) }
  context 'can save a personality profile that they have generated from text' do
    it 'and see the personality profile on their dashboard' do
      VCR.use_cassette('saved_personality_profile_from_text') do
        user = create(:user, id: 1)
        profile = create(:personality_profile, name: 'Nicholas Cage', username: nil, total_tweets_analyzed: nil, newest_tweet_analyzed_date: nil, oldest_tweet_analyzed_date: nil)
        create(:dimension); create(:facet); create(:need); create(:value)
        saved_profile = create(:saved_profile, user_id: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit '/dashboard'

        click_on "#{profile.name}"

        expect(current_path).to eq("/saved-profiles/#{saved_profile.id}")
      end
    end
  end
end
