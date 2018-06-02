require 'rails_helper'

describe Facet, type: :model do
  it {should belong_to :dimension}
end
