class Value
  attr_reader :name, :percentile
  def initialize(value)
    @name = value[:name]
    @percentile = value[:percentile]
  end
end  
