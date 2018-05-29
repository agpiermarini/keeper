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
        expect(subject.facets.count).to eq(6)

        expect(subject.facets.first).to be_a Facet
        expect(subject.facets.first.name).to eq("Adventurousness")
        expect(subject.facets.first.percentile).to eq(0.364916201669199)

        expect(subject.facets.last).to be_a Facet
        expect(subject.facets.last.name).to eq("Authority-challenging")
        expect(subject.facets.last.percentile).to eq(0.832943674792473)
      end
    end
  end
end
