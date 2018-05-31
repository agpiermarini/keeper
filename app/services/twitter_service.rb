class TwitterService
  def initialize(endpoint, params, headers = { Authorization: "Bearer #{ENV["twitter_bearer_token"]}" } )
    @endpoint = endpoint
    @params = params
    @headers = headers
  end

  def response
    JSON.parse(json_response.body, symbolize_names: true)
  end

  private
    attr_reader :endpoint, :params, :headers

    def connection
      Faraday.new("https://api.twitter.com/1.1/#{endpoint}")
    end

    def json_response
      connection.get do | req |
        req.headers = headers
        req.params = params
      end
    end
end
