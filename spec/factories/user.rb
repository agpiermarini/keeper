FactoryBot.define do
  factory :user do
    uid 1
    username "katyperry"
    avatar_url "http://pbs.twimg.com/profile_images/968045861958635520/LxDeesSo_normal.jpg"
    oauth_token ENV["twitter_oauth_token"]
    oauth_secret ENV["twitter_oauth_secret"]
  end
end
