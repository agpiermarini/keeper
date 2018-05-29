require 'rails_helper'

describe Value do
  let(:data) { stub_profile[:values].first }
  subject { Value.new(data) }
  it 'initializes with personality dimension info' do
    expect(subject).to be_a Value
    expect(subject.name).to eq(data[:name])
    expect(subject.percentile).to eq(data[:percentile])
  end
end
