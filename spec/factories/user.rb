FactoryBot.define do
  factory :user do
    uid 1
    username "username"
    avatar_url "https://www.biography.com/.image/t_share/MTE5NDg0MDU1MTc0MjE5Mjc5/frank-zappa-9540382-2-raw.jpg"
    oauth_token ENV["twitter_oauth_token"]
    oauth_secret ENV["twitter_oauth_secret"]
  end
end
