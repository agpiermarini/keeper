class TwitterProfileSearch
  def initialize(username)
    @username = username
  end

  def profile
    profile_info = twitter_service(profile_endpoint, profile_params).response
    Profile.new(profile_info)
  end

  private
    attr_reader :username

    def profile_endpoint
      "/users/show.json"
    end

    def profile_params
      { screen_name: username }
    end

    def twitter_service(endpoint, params)
      TwitterService.new(endpoint, params)
    end
end
