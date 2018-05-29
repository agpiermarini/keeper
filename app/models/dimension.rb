class Dimension
  attr_reader :name, :percentile
  def initialize(dimension)
    @name          = dimension[:name]
    @percentile    = dimension[:percentile]
    @facets_info   = dimension[:children]
  end

  def facets
    facets_info.map do | facet |
      Facet.new(facet)
    end
  end

  private
    attr_reader :facets_info
end
