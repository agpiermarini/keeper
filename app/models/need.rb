class Need
  attr_reader :name, :percentile
  def initialize(need)
    @name = need[:name]
    @percentile = need[:percentile]
  end
end
