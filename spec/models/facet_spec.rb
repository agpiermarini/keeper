require 'rails_helper'

describe Facet, type: :model do
  describe 'relationships' do
    it {should belong_to :dimension}
  end
end
