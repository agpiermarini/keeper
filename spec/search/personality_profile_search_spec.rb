require 'rails_helper'

describe PersonalityProfileSearch do
  subject { PersonalityProfileSearch.new('turingschool') }
  it 'initializes with username' do
    expect(subject).to be_a PersonalityProfileSearch
  end
end
