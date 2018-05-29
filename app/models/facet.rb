class Facet
  attr_reader :name, :percentile
  def initialize(facet)
    @name       = facet[:name]
    @percentile = facet[:percentile]
  end
end
