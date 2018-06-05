FactoryBot.define do
  factory :personality_profile do
    name 'Neil deGrasse Tyson'
    username '@neiltyson'
    avatar_url "http://pbs.twimg.com/profile_images/968045861958635520/LxDeesSo_normal.jpg"
    word_count 600
    total_tweets_analyzed 600
    newest_tweet_analyzed_date Date.today
    oldest_tweet_analyzed_date Date.today
    created_at Date.today
    updated_at Date.today
  end
end
