class PersonalityInsightsSearch
  def initialize(username, data)
    @username = username
    @data = data
  end

  def profile
    PersonalityInsightsProfile.new(profile) unless error_message
  end

  def warning_message
    profile_info[:message]
  end

  def error_message
    profile_info[:error]
  end

  private
    attr_reader :username, :data

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

    def profile_info
      JSON.parse(response.body, symbolize_names: true)
    end



    # req.body                   = Faraday::UploadIO.new("./db/data/#{generate_file}.txt", 'plain/text')

    # def generate_file(text = data)
    #   File.open("db/data/#{generate_file_name}.txt", 'w') { |file| file.write(text) }
    #   return @filename
    # end
    #
    # def generate_file_name
    #   @filename ||= "#{username}#{Time.now}"
    # end
end
