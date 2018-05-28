class PersonalityProfileSearch
  def initialize(username, data)
    @username = username
    @data = data
  end

  def profile
    connection = Faraday.new("https://gateway.watsonplatform.net/personality-insights/api/v3/profile?version=2017-10-13") do | faraday |
      faraday.request :multipart
      faraday.response :logger
      faraday.adapter :net_http
      faraday.basic_auth(ENV["watson_username"], ENV["watson_password"])
    end

    response = connection.post do | req |
      req.headers["Content-Type"]  = "text/plain;charset=utf-8"
      req.headers["Accept"]        = "application/json"
      req.body                     = Faraday::UploadIO.new("./db/data/#{generate_file}.txt", 'plain/text')
      req.headers["Authorization"]
    end

    info = JSON.parse(response.body, symbolize_names: true)
    PersonalityProfile.new(info)
  end

  private
    attr_reader :username, :data

    def generate_file(text = data)
      File.open("db/data/#{generate_file_name}.txt", 'w') { |file| file.write(text) }
      return @filename
    end

    def generate_file_name
      @filename ||= "#{username}#{Time.now}"
    end
end
