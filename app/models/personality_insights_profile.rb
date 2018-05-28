class PersonalityInsightsProfile
  attr_reader :word_count, :word_count_message
  def initialize(profile_hash)
    @word_count         = profile_hash[:word_count]
    @word_count_message = profile_hash[:word_count_message]
    @personality_data   = profile_hash[:personality]
    @values_data        = profile_hash[:values]
  end

  def personality
    personality_data.map do | dimension |
      Dimension.new(dimension)
    end
  end

  private
    attr_reader :personality_data, :values_data
end
