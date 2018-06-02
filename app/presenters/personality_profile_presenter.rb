class PersonalityProfilePresenter
  def initialize(username)
    @username = username
  end

  def subject_avatar
    user_data.avatar_url
  end

  def subject_name
    user_data.name
  end

  def subject_username
    user_data.username
  end

  def subject_description
    user_data.description
  end

  def subject_location
    user_data.location
  end

  def total_tweets_analyzed
    timeline_data.total_tweets
  end

  def oldest_tweet_analyzed
    timeline_data.oldest_tweet
  end

  def newest_tweet_analyzed
    timeline_data.newest_tweet
  end

  def warning_message
    personality_data.warning_message
  end

  def valid?
    return true unless personality_data.error_message
  end

  def error_message
    personality_data.error_message unless valid?
  end

  def dimensions
    valid? ? profile.dimensions : nil
  end

  def needs
    valid? ? profile.needs : nil
  end

  def values
    valid? ? profile.values : nil
  end



  private
    attr_reader :username

    def user_data
      @user_data ||= TwitterProfileSearch.new(username).profile
    end

    def timeline_data
      @timeline_data ||= TwitterTimelineSearch.new(username)
    end

    def personality_data
      @personality_data ||= PersonalityInsightsSearch.new(username, timeline_data.to_string)
    end

    def profile
      personality_data.profile
    end

end
