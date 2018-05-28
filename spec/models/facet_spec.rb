require 'rails_helper'

describe Facet do
  let(:data) { stub_profile[:personality].first[:children].first }
  subject { Facet.new(data) }
  it 'initializes with facet info' do
    require 'pry'; binding.pry
    expect(subject).to be_a Facet
    expect(subject.name).to eq("Adventurousness")
    expect(subject.percentile).to eq(0.364916201669199)
  end
end
