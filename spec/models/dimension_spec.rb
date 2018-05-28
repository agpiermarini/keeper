require 'rails_helper'

describe Dimension do
  let(:data) { stub_profile[:personality].first }
  subject { Dimension.new(data) }
  it 'initializes with personality dimension info' do
    expect(subject).to be_a Dimension
    expect(subject.name).to eq(data[:name])
    expect(subject.percentile).to eq(data[:percentile])
  end

  describe 'instance methods' do
    describe '#facets' do
      it 'returns an array of facets of the dimension' do
        expect(subject.facets).to be_an Array
        expect(subject.facets.first).to be_a Facet
      end
    end
  end
end
