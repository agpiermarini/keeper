class Profile
  attr_reader :username, :name, :location, :description, :followers_count,
              :following_count, :tweet_count

  def initialize(profile_info)
    @username          = profile_info[:screen_name]
    @name              = profile_info[:name]
    @location          = profile_info[:location]
    @description       = profile_info[:description]
    @followers_count   = profile_info[:followers_count]
    @following_count   = profile_info[:friends_count]
    @tweet_count       = profile_info[:statuses_count]
    @status            = profile_info[:status]
    @small_avatar_url  = profile_info[:profile_image_url]
  end

  def last_tweet
    status[:text] unless status.nil?
  end

  def last_tweet_date
    DateTime.parse(status[:created_at]).strftime('%B %e, %Y') unless status.nil?
  end

  def avatar_url
    small_avatar_url.gsub("normal", "400x400")
  end

  private
    attr_reader :status, :small_avatar_url
end
