class PersonalityProfileGenerator
  def initialize(username)
    @username = username
  end

  def generate!
    if personality_data[:error].nil?
      profile = PersonalityProfile.create!(username:                   username,
                                           name:                       timeline_data.name,
                                           avatar_url:                 timeline_data.avatar_url,
                                           word_count:                 personality_data[:word_count],
                                           warning_message:            personality_data[:word_count_message],
                                           error_message:              personality_data[:error],
                                           total_tweets_analyzed:      timeline_data.total_tweets,
                                           newest_tweet_analyzed_date: timeline_data.newest_tweet,
                                           oldest_tweet_analyzed_date: timeline_data.oldest_tweet,
                                           created_at:                 Date.today,
                                           updated_at:                 Date.today
                                          )

      generate_dimensions!(profile.id)
      generate_needs!(profile.id)
      generate_values!(profile.id)
    else
      require 'pry'; binding.pry
      PersonalityProfile.create!(username: username,
                                 error_message: personality_data[:error],
                                 created_at: Date.today,
                                 updated_at: Date.today)
    end
  end

  private
    attr_reader :username

    def generate_dimensions!(profile_id)
      personality_data[:personality].each do | dimension |
        new_dimension = Dimension.create!(name:                   dimension[:name],
                                          percentile:             dimension[:percentile],
                                          personality_profile_id: profile_id
                                          )
        generate_facets!(dimension, new_dimension.id)
      end
    end

    def generate_facets!(dimension, dimension_id)
      dimension[:children].each do | facet |
        Facet.create!(name:         facet[:name],
                      percentile:   facet[:percentile],
                      dimension_id: dimension_id
                      )
      end
    end

    def generate_needs!(profile_id)
      personality_data[:needs].each do | need |
        Need.create!(name:                   need[:name],
                     percentile:             need[:percentile],
                     personality_profile_id: profile_id
                    )
      end
    end

    def generate_values!(profile_id)
      personality_data[:values].each do | value |
        Value.create!(name:                   value[:name],
                      percentile:             value[:percentile],
                      personality_profile_id: profile_id
                      )
      end
    end

    def timeline_data
      @timeline_data ||= TwitterTimelineSearch.new(username)
    end

    def personality_data
      @personality_data = private_account_error if timeline_data.private_account?
      @personality_data ||= PersonalityProfileSearch.new(timeline_data.to_string).profile_info
    end

    def private_account_error
      {error: "This user's account has been set to private. As such, we are unable to retrieve any tweets for analysis"}
    end
end
