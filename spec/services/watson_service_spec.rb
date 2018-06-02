require 'rails_helper'

describe WatsonService do
  subject { WatsonService.new("data") }
  it 'initializes with data' do
    expect(subject).to be_a WatsonService
  end
end
