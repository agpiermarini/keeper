require 'rails_helper'

describe Need do
  subject { Need.new({name: "harmony", percentile: 1}) }
  it 'initializes with hash' do
    expect(subject).to be_a Need
  end
end
