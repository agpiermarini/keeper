class Profile
  attr_reader :username, :name, :location, :description, :followers_count,
              :following_count, :tweet_count, :last_tweet, :avatar_url

  def initialize(profile_info)
    @username         = profile_info[:screen_name]
    @name             = profile_info[:name]
    @location         = profile_info[:location]
    @description      = profile_info[:description]
    @followers_count  = profile_info[:followers_count]
    @following_count  = profile_info[:friends_count]
    @tweet_count      = profile_info[:statuses]
    @last_tweet       = profile_info[:last_status]
    @avatar_url       = profile_info[:profile_image_url]
  end
end
