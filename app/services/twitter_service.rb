class TwitterService
  def initialize(endpoint, params)
    @endpoint = endpoint
    @params = params
  end

  def call_info
    JSON.parse(response.body, symbolize_names: true)
  end


  private
    attr_reader :endpoint, :params

    def connection
      Faraday.new("https://api.twitter.com/1.1/#{endpoint}")
    end

    def response
      connection.get do | req |
        req.headers["Authorization"] = "Bearer #{ENV["twitter_bearer_token"]}"
        req.params = params
      end
    end
end
