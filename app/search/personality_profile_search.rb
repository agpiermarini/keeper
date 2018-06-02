class PersonalityProfileSearch
  def initialize(username, data)
    @data = data
  end

  def profile_info
    client.profile_info
  end

  private
    attr_reader :username, :data

    def client
      @client ||= WatsonService.new(data)
    end
end
