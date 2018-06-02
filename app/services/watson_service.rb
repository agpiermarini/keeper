class WatsonService
  def initialize(data)
    @data = data
  end

  def profile_info
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :data

    def connection
      Faraday.new("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13") do | faraday |
        faraday.request :multipart
        faraday.response :logger
        faraday.adapter :net_http
        faraday.basic_auth(ENV["watson_username"], ENV["watson_password"])
      end
    end

    def response
      @response ||= connection.post do | req |
        req.headers["Authorization"]
        req.headers["Content-Type"]  = "text/plain;charset=utf-8"
        req.headers["Accept"]        = "application/json"
        req.body                     = data
      end
    end
end
