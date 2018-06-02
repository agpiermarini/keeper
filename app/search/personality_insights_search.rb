class PersonalityInsightsSearch
  def initialize(username, data)
    @username = username
    @data = data
  end

  def profile
    PersonalityInsightsProfile.new(profile_info) unless error_message
  end

  def warning_message
    profile_info[:message]
  end

  def error_message
    profile_info[:error]
  end

  private
    attr_reader :username, :data

    def profile_info
      WatsonService.new(data).profile_info
    end
end
