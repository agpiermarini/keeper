class ProfileSearch
  def initialize(username)
    @username = username
  end

  def profile
    connection = Faraday.new("https://api.twitter.com/1.1/users/show.json")

    response = connection.get do | req |
      req.headers["Authorization"] = "Bearer #{ENV["twitter_bearer_token"]}"
      req.params["screen_name"] = username
    end

    profile_info = JSON.parse(response.body, symbolize_names: true)

    Profile.new(profile_info)
  end

  private
    attr_reader :username
end
