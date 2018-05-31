class PersonalityInsightsProfile
  attr_reader :word_count, :word_count_message
  def initialize(profile_hash)
    @word_count         = profile_hash[:word_count]
    @word_count_message = profile_hash[:word_count_message]
    @personality_data   = profile_hash[:personality]
    @needs_data         = profile_hash[:needs]
    @values_data        = profile_hash[:values]
  end

  def personality
    personality_data.map { | dimension | Dimension.new(dimension) }
  end

  def needs
    needs_data.map { | need | Need.new(need) }
  end

  def values
    values_data.map { | value | Value.new(value) }
  end

  private
    attr_reader :personality_data, :values_data, :needs_data
end
