class PersonalityProfileSearch
  def initialize(data)
    @data = data
  end

  def profile_info
    client.profile_info
  end

  private
    attr_reader :data

    def client
      @client ||= WatsonService.new(data)
    end
end
